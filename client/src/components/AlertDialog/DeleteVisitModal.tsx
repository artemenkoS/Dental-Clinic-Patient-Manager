import { Button, Modal, Typography } from '@mui/material';
import * as React from 'react';

import { useDeleteVisitMutation } from '../../api/visit/visitApi';
import { useAppDispatch } from '../../store/hooks';
import { useAppSelector } from '../../store/hooks';
import { deleteVisitModalSelector } from '../../store/slices/modalsSlice';
import { setDeleteVisitId, setDeleteVisitModalOpened } from '../../store/slices/modalsSlice';
import { ButtonWrapper, StyledBox } from './styled';

export const DeleteVisitModal: React.FC = () => {
  const dispatch = useAppDispatch();

  const modalState = useAppSelector(deleteVisitModalSelector);

  const handleClose = () => {
    dispatch(setDeleteVisitModalOpened(false));
    dispatch(setDeleteVisitId(null));
  };

  const handleDeleteVisit = () => {
    if (modalState.visitId) mutate(modalState.visitId);
  };

  const [mutate, { isSuccess: deleteVisitSuccess, reset }] = useDeleteVisitMutation();

  React.useEffect(() => {
    if (deleteVisitSuccess) {
      reset();
      handleClose();
    }
  }, [deleteVisitSuccess]);

  return (
    <div>
      <Modal keepMounted open={modalState.isOpen} onClose={handleClose}>
        <StyledBox>
          <Typography variant="h6">Вы точно хотите удалить данную запись?</Typography>
          <ButtonWrapper>
            <Button variant="outlined" size="large" onClick={handleClose}>
              Отменить
            </Button>
            <Button type="submit" variant="contained" color="error" onClick={handleDeleteVisit}>
              Удалить запись
            </Button>
          </ButtonWrapper>
        </StyledBox>
      </Modal>
    </div>
  );
};
