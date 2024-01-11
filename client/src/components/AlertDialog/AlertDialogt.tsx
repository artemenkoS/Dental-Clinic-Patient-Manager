import { Button, Modal, Typography } from '@mui/material';
import * as React from 'react';

import { ButtonWrapper, Container } from './styled';

interface Props {
  onClick: () => void;
  handleClose: () => void;
  cancelText?: string;
  submitText?: string;
  dialogText: string;
  isOpen: boolean;
}

export const AlertDialog: React.FC<Props> = ({
  onClick,
  cancelText = 'Отменить',
  submitText = 'Подтвердить',
  dialogText,
  handleClose,
  isOpen,
}) => {
  return (
    <div>
      <Modal keepMounted open={isOpen} onClose={handleClose}>
        <Container>
          <Typography variant="h6">{dialogText}</Typography>
          <ButtonWrapper>
            <Button variant="outlined" size="large" onClick={handleClose}>
              {cancelText}
            </Button>
            <Button type="submit" variant="contained" color="error" onClick={onClick}>
              {submitText}
            </Button>
          </ButtonWrapper>
        </Container>
      </Modal>
    </div>
  );
};
