import { Button } from '@mui/material';

import { useAppDispatch } from '../../store/hooks';
import { setPatientModalOpened } from '../../store/slices/modalsSlice';

export const OpenPatientButton = () => {
  const dispatch = useAppDispatch();
  return (
    <Button variant="outlined" onClick={() => dispatch(setPatientModalOpened(true))}>
      Добавить пациента
    </Button>
  );
};
