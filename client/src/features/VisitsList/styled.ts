import styled from '@emotion/styled';
import { Box, Paper } from '@mui/material';

import { theme } from '../../styles/theme';

export const Wrapper = styled.div`
  height: 100%;
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

export const List = styled(Box)`
  margin: 0 0 ${theme.spacing(5)};
  overflow-y: auto;
  box-sizing: content-box;
  flex: 1 0 500px;
`;

export const Slot = styled(Paper)`
  display: flex;
  align-items: center;
  gap: ${theme.spacing(1)};
  margin-bottom: ${theme.spacing(1)};
  padding: ${theme.spacing(1)};
  height: 70px;
`;

export const ControlsContainer = styled.div`
  display: flex;
  margin-left: auto;
`;

export const VisitsWrapper = styled.div`
  height: 80%;
  overflow: auto;
  padding: ${theme.spacing(0.4)};
`;

export const PatientSurname = styled.span`
  cursor: pointer;
`;
