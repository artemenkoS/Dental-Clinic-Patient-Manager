import styled from '@emotion/styled';

import { theme } from '../../styles/theme';

export const Wrapper = styled.div`
  height: 100%;
  margin: 0;
  padding: 0;
  display: flex;
  flex-direction: column;
`;

export const List = styled.ul`
  margin: 0 0 ${theme.spacing(5)};
  overflow: auto;
  flex: 1 0 auto;
`;

export const Slot = styled.li`
  border: 1px solid black;
  display: flex;
  align-items: center;
  gap: ${theme.spacing(1)};
  margin: ${theme.spacing(1)};
  padding: ${theme.spacing(1)};
`;
