import EditIcon from '@mui/icons-material/Edit';
import { IconButton } from '@mui/material';

import { Visit } from '../../api/visit/types';
import { useAppDispatch } from '../../store/hooks';
import { setEditableVisit, setEditVisitModalOpened, setEditVisitModalSubmitText } from '../../store/slices/modalsSlice';

interface Props {
  visit: Visit;
  disabled?: boolean;
}

export const EditVisitButton: React.FC<Props> = ({ visit, disabled }) => {
  const dispatch = useAppDispatch();
  const onClick = () => {
    dispatch(setEditableVisit(visit));
    dispatch(setEditVisitModalOpened(true));
    dispatch(setEditVisitModalSubmitText('Изменить запись'));
  };
  return (
    <IconButton onClick={onClick} disabled={disabled}>
      <EditIcon />
    </IconButton>
  );
};

// () => dispatch(setPatientModalOpened(true))
