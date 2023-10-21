import * as React from 'react';

import { useDeleteVisitMutation } from '../../api/visit/visitApi';
import { AlertDialog } from '../../components/AlertDialog/AlertDialogt';
import { useAppDispatch } from '../../store/hooks';
import { useAppSelector } from '../../store/hooks';
import { deleteVisitModalSelector } from '../../store/slices/modalsSlice';
import { setDeleteVisitId, setDeleteVisitModalOpened } from '../../store/slices/modalsSlice';

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

  return <AlertDialog dialogText="Вы точно хотите удалить данную запись?" onClick={handleDeleteVisit} />;
};
