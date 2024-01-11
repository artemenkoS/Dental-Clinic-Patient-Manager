import { Button } from '@mui/material';

import { useAppDispatch } from '../../store/hooks';
import { setVacationModalOpened, setVacationModalSubmitText } from '../../store/slices/modalsSlice';
import { theme } from '../../styles/theme';

export const NewVacationButton: React.FC = () => {
  const dispatch = useAppDispatch();
  const onClick = () => {
    dispatch(setVacationModalOpened(true));
    dispatch(setVacationModalSubmitText('Добавить отпуск'));
  };
  return (
    <Button
      onClick={onClick}
      variant="outlined"
      color="success"
      size="large"
      sx={{ height: theme.spacing(4), alignSelf: 'flex-start', position: 'absolute', right: theme.spacing(3) }}
    >
      Добавить отпуск
    </Button>
  );
};
