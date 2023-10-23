import { Outlet } from 'react-router-dom';

import { Logout } from '../Logout/Logout';
import { NavBar } from '../NavBar/NavBar';
import { ContentLayout, ContentWrapper, Header, HeaderTitle, Sidebar, Wrapper } from './styled';

export const Layout = () => {
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
    </Wrapper>
  );
};
