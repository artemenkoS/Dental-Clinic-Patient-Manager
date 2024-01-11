import * as React from 'react';

import { useDeleteVacationMutation } from '../../api/vacation/vacationApi';
import { AlertDialog } from '../../components/AlertDialog/AlertDialogt';
import { useAppDispatch } from '../../store/hooks';
import { useAppSelector } from '../../store/hooks';
import { deleteVacationModal, setDeleteVacationId, setDeleteVacationModalOpen } from '../../store/slices/modalsSlice';

export const DeleteVacationModal: React.FC = () => {
  const dispatch = useAppDispatch();

  const { vacation, isOpen } = useAppSelector(deleteVacationModal);

  const handleClose = () => {
    dispatch(setDeleteVacationModalOpen(false));
    dispatch(setDeleteVacationId(null));
  };

  const handleDeleteVisit = () => {
    if (vacation) {
      mutate(vacation.id);
    }
  };

  const [mutate, { isSuccess: deleteVacationSuccess, reset }] = useDeleteVacationMutation();

  React.useEffect(() => {
    if (deleteVacationSuccess) {
      reset();
      handleClose();
    }
  }, [deleteVacationSuccess]);

  return (
    <AlertDialog
      dialogText="Вы точно хотите удалить данную запись?"
      onClick={handleDeleteVisit}
      handleClose={handleClose}
      isOpen={isOpen}
    />
  );
};
