import DeleteIcon from '@mui/icons-material/Delete';
import { IconButton } from '@mui/material';

import { Vacation } from '../../api/vacation/types';
import { useAppDispatch } from '../../store/hooks';
import { setDeleteVacationId, setDeleteVacationModalOpen } from '../../store/slices/modalsSlice';

interface Props {
  vacation: Vacation;
  disabled?: boolean;
}

export const DeleteVacationButton: React.FC<Props> = ({ vacation, disabled }) => {
  const dispatch = useAppDispatch();
  const onClick = () => {
    dispatch(setDeleteVacationId(vacation));
    dispatch(setDeleteVacationModalOpen(true));
  };
  return (
    <IconButton onClick={onClick} disabled={disabled}>
      <DeleteIcon fontSize="small" />
    </IconButton>
  );
};
