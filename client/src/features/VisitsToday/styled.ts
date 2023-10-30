import styled from '@emotion/styled';

import { theme } from '../../styles/theme';

export const Wrapper = styled.div`
  max-height: 800px;
  margin: 0;
  padding: 0;
  display: flex;
  flex-direction: column;
`;

export const VisitsContainer = styled.div`
  display: flex;
  height: 100%;
  gap: ${theme.spacing(2)};
`;

export const VisitTime = styled.span`
  font-weight: 700;
  border: 2px solid black;
  border-radius: ${theme.spacing(1)};
  padding: ${theme.spacing(0.3)};
`;

export const List = styled.ul`
  margin: 0 0 ${theme.spacing(5)};
  overflow: auto;
  flex: 1 0 500px;
`;

export const Slot = styled.div`
  border: 1px solid black;
  display: flex;
  align-items: center;
  gap: ${theme.spacing(1)};
  margin-bottom: ${theme.spacing(1)};
  padding: ${theme.spacing(1)};
  height: 70px;
`;

export const ControlsContainer = styled.div`
  display: flex;
  align-self: flex-end;
  margin-left: auto;
`;
