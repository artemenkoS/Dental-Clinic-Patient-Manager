import { Outlet } from 'react-router-dom';

import { Logout } from '../Logout/Logout';
import { ContentLayout, ContentWrapper, Header, HeaderTitle, Sidebar } from './styled';

export const Layout = () => {
  return (
    <div>
      <Header>
        <HeaderTitle>MyApp MyApp</HeaderTitle>
        <Logout />
      </Header>
      <ContentLayout>
        <Sidebar></Sidebar>
        <ContentWrapper>
          <Outlet />
        </ContentWrapper>
      </ContentLayout>
    </div>
  );
};
