import DeleteIcon from '@mui/icons-material/Delete';
import { IconButton } from '@mui/material';

import { Visit } from '../../api/visit/types';
import { useAppDispatch } from '../../store/hooks';
import { setDeleteVisitId, setDeleteVisitModalOpened, setEditLogStatus } from '../../store/slices/modalsSlice';

interface Props {
  visit: Visit;
}

export const DeleteVisitButton: React.FC<Props> = ({ visit }) => {
  const dispatch = useAppDispatch();
  const onClick = () => {
    dispatch(setDeleteVisitId(visit));
    dispatch(setDeleteVisitModalOpened(true));
    dispatch(setEditLogStatus('delete'));
  };
  return (
    <IconButton onClick={onClick}>
      <DeleteIcon />
    </IconButton>
  );
};
