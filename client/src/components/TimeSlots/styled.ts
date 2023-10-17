import styled from '@emotion/styled';
import { Button } from '@mui/material';

import { theme } from '../../styles/theme';

export const Wrapper = styled.div`
  max-height: 400px;
  overflow: auto;
`;

export const Slot = styled(Button)`
  border: 1px solid black;
  border-radius: 2px;
  margin: ${theme.spacing(1)};

  text-align: center;
  padding: ${theme.spacing(1)};
  font-size: ${theme.spacing(2)};
`;
