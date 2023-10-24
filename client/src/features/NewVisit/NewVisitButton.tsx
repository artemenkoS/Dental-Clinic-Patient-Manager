import { Button } from '@mui/material';

import { useAppDispatch } from '../../store/hooks';
import { setEditLogStatus, setEditVisitModalOpened, setEditVisitModalSubmitText } from '../../store/slices/modalsSlice';
import { theme } from '../../styles/theme';

export const NewVisitButton: React.FC = () => {
  const dispatch = useAppDispatch();
  const onClick = () => {
    dispatch(setEditVisitModalOpened(true));
    dispatch(setEditVisitModalSubmitText('Создать запись'));
    dispatch(setEditLogStatus('create'));
  };
  return (
    <Button onClick={onClick} variant="outlined" color="success" sx={{ height: theme.spacing(4) }}>
      Создать запись
    </Button>
  );
};
