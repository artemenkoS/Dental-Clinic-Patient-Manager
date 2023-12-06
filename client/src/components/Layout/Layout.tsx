import dayjs from 'dayjs';
import React from 'react';
import toast from 'react-hot-toast';
import { Outlet } from 'react-router-dom';

import { useLazyGetNotificationsQuery } from '../../api/notification/notificationApi';
import { useGetRolesQuery } from '../../api/role/rolesApi';
import { useLazyGetVisitsQuery } from '../../api/visit/visitApi';
import notification from '../../assets/sounds/notification.mp3';
import { NotificationList } from '../../features/NotificationList/NotificationList';
import { getDoctorRole } from '../../helpers/getDoctorRole';
import { useAppSelector } from '../../store/hooks';
import { userSelector } from '../../store/slices/authSlice';
import { visitDateSelector } from '../../store/slices/visitSlice';
import { Logout } from '../Logout/Logout';
import { NavBar } from '../NavBar/NavBar';
import { prepareNotificationText } from './helpers';
import { ContentLayout, ContentWrapper, Header, HeaderTitle, Sidebar, Wrapper } from './styled';

export const Layout = () => {
  const user = useAppSelector(userSelector);
  const date = useAppSelector(visitDateSelector);
  const { data: roles } = useGetRolesQuery();
  const doctorRole = React.useMemo(() => getDoctorRole(roles?.data), [roles]);
  const ws = React.useRef<WebSocket>();
  const audioRef = React.useRef<HTMLAudioElement>(new Audio(notification));
  const [getVisits] = useLazyGetVisitsQuery();
  const [getNotifications] = useLazyGetNotificationsQuery();

  React.useEffect(() => {
    ws.current = new WebSocket('ws://localhost:8000');

    return () => {
      if (ws?.current?.readyState === 1) {
        ws.current.close();
      }
    };
  }, []);

  React.useEffect(() => {
    if (ws.current) {
      ws.current.onopen = () => {
        ws.current?.send(JSON.stringify({ action: 'connect', ...user }));
      };

      ws.current.onmessage = (event) => {
        const parsedData = JSON.parse(event.data);
        getVisits({
          startDate: dayjs(date).format('YYYY-MM-DD'),
          sort: JSON.stringify([{ field: 'visitDate', sort: 'asc' }]),
        });
        getNotifications({ id: user?.id ?? 0 });

        if (doctorRole && user?.id !== parsedData.authorId && parsedData.doctorId === user?.id) {
          toast(prepareNotificationText(event.data));

          if (audioRef.current) {
            audioRef.current.play();
          }
        }
      };
    }
  }, [date, doctorRole, getNotifications, getVisits, roles, user]);

  return (
    <Wrapper>
      <Header>
        <HeaderTitle>Лучшая стоматология в мире</HeaderTitle>
        <NotificationList />
        <Logout />
      </Header>
      <ContentLayout>
        <Sidebar>
          <NavBar />
        </Sidebar>
        <ContentWrapper>
          <Outlet />
        </ContentWrapper>
      </ContentLayout>

      <audio ref={audioRef} src={notification} />
    </Wrapper>
  );
};
