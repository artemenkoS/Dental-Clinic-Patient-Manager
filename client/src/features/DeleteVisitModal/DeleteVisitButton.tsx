import DeleteIcon from '@mui/icons-material/Delete';
import { IconButton } from '@mui/material';

import { useAppDispatch } from '../../store/hooks';
import { setDeleteVisitId, setDeleteVisitModalOpened } from '../../store/slices/modalsSlice';

interface Props {
  id: number;
}

export const DeleteVisitButton: React.FC<Props> = ({ id }) => {
  const dispatch = useAppDispatch();
  const onClick = () => {
    dispatch(setDeleteVisitId(id));
    dispatch(setDeleteVisitModalOpened(true));
  };
  return (
    <IconButton onClick={onClick}>
      <DeleteIcon />
    </IconButton>
  );
};

