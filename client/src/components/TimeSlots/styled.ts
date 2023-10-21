import styled from '@emotion/styled';
import { Button } from '@mui/material';

import { theme } from '../../styles/theme';

export const Wrapper = styled.div`
  max-height: 400px;
  overflow: auto;
`;

export const Slot = styled(Button)`
  border: 1px solid black;
  margin: ${theme.spacing(1)};

  text-align: center;
  padding: ${theme.spacing(1)};
  font-size: ${theme.spacing(2)};
  &.selected {
    background-color: ${theme.palette.success.light};
    color: ${theme.palette.secondary.contrastText};
  }
`;
