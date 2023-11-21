import React from 'react';
import toast from 'react-hot-toast';
import { Outlet } from 'react-router-dom';

import notification from '../../assets/sounds/notification.mp3';
import { useAppSelector } from '../../store/hooks';
import { userSelector } from '../../store/slices/authSlice';
import { Logout } from '../Logout/Logout';
import { NavBar } from '../NavBar/NavBar';
import { prepareNotificationText } from './helpers';
import { ContentLayout, ContentWrapper, Header, HeaderTitle, Sidebar, Wrapper } from './styled';

export const Layout = () => {
  const user = useAppSelector(userSelector);
  const ws = React.useRef<WebSocket>();
  const audioRef = React.useRef<HTMLAudioElement>(new Audio(notification));

  React.useEffect(() => {
    ws.current = new WebSocket('ws://localhost:8000');

    return () => {
      ws.current?.close();
    };
  }, []);

  React.useEffect(() => {
    if (ws.current) {
      ws.current.onopen = () => {
        ws.current?.send(JSON.stringify({ action: 'connect', ...user }));
      };

      ws.current.onmessage = (event) => {
        console.log(event.data);
        toast.success(prepareNotificationText(event.data));

        if (audioRef.current) {
          audioRef.current.play();
        }
      };
    }
  }, [user]);

  return (
    <Wrapper>
      <Header>
        <HeaderTitle>Лучшая стоматология в мире</HeaderTitle>
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
