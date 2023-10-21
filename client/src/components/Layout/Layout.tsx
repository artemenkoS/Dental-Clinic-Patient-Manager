import { Outlet } from 'react-router-dom';

import { Logout } from '../Logout/Logout';
import { ContentLayout, ContentWrapper, Header, HeaderTitle, Sidebar, Wrapper } from './styled';

export const Layout = () => {
  return (
    <Wrapper>
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
    </Wrapper>
  );
};
