import dayjs from 'dayjs';
import React from 'react';
import { useHotkeys } from 'react-hotkeys-hook';
import { Outlet } from 'react-router-dom';
import { toast } from 'react-toastify';

import { useLazyGetNotificationsQuery } from '../../api/notification/notificationApi';
import { useLazyGetVisitsQuery } from '../../api/visit/visitApi';
import notification from '../../assets/sounds/notification.mp3';
import { NotificationList } from '../../features/NotificationList/NotificationList';
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
  const ws = React.useRef<WebSocket>();
  const audioRef = React.useRef<HTMLAudioElement>(new Audio(notification));
  const [getVisits] = useLazyGetVisitsQuery();
  const [getNotifications] = useLazyGetNotificationsQuery();

  useHotkeys('ctrl+1', () => {
    const message = JSON.stringify({ action: 'sos', authorId: user?.id });

    if (ws.current && ws.current.readyState === WebSocket.OPEN) {
      ws.current.send(message);
    }
  });
  React.useEffect(() => {
    ws.current = new WebSocket(
      import.meta.env.DEV ? `ws://${import.meta.env.VITE_API_URL_DEV}` : `ws://${import.meta.env.VITE_API_URL_PROD}`
    );

    return () => {
      if (ws?.current?.readyState === 1) {
        ws.current.close();
      }
    };
  }, []);

  React.useEffect(() => {
    if (ws.current) {
      ws.current.onopen = () => {
        ws.current?.readyState === 1 &&
          ws.current?.CONNECTING &&
          ws.current?.send(JSON.stringify({ action: 'connect', ...user }));
      };

      ws.current.onmessage = (event) => {
        const parsedData = JSON.parse(event.data);
        getVisits({
          startDate: dayjs(date).format('YYYY-MM-DD'),
          sort: JSON.stringify([{ field: 'visitDate', sort: 'asc' }]),
        });
        getNotifications({ id: user?.id ?? 0 });

        if (user?.id !== parsedData.authorId) {
          toast(prepareNotificationText(event.data), { autoClose: false });

          if (audioRef.current) {
            audioRef.current.play();
          }
        }
      };
    }
  }, [date, getNotifications, getVisits, user]);

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
