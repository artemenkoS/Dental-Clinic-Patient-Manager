import { Button } from '@mui/material';

import { useAppDispatch } from '../../store/hooks';
import { setPatientModalOpened } from '../../store/slices/modalsSlice';
import { theme } from '../../styles/theme';

export const NewPatienButton = () => {
  const dispatch = useAppDispatch();
  return (
    <Button variant="outlined" onClick={() => dispatch(setPatientModalOpened(true))} sx={{ height: theme.spacing(4) }}>
      Добавить пациента
    </Button>
  );
};
