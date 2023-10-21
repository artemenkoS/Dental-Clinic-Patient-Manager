import EditIcon from '@mui/icons-material/Edit';
import { IconButton } from '@mui/material';

import { Visit } from '../../api/visit/types';
import { useAppDispatch } from '../../store/hooks';
import { setEditableVisit, setEditVisitModalOpened } from '../../store/slices/modalsSlice';

interface Props {
  visit: Visit;
}

export const EditVisitButton: React.FC<Props> = ({ visit }) => {
  const dispatch = useAppDispatch();
  const onClick = () => {
    dispatch(setEditableVisit(visit));
    dispatch(setEditVisitModalOpened(true));
  };
  return (
    <IconButton onClick={onClick}>
      <EditIcon />
    </IconButton>
  );
};

// () => dispatch(setPatientModalOpened(true))
