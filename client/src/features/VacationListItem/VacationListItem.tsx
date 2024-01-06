import { ListItem, ListItemText, Typography } from '@mui/material';
import dayjs from 'dayjs';

import { Doctor } from '../../api/doctor/types';
import { Vacation } from '../../api/vacation/types';
import { DeleteVacationButton } from '../DeleteVacationModal/DeleteVacationButton';

interface Props {
  doctor: Doctor;
  vacation: Vacation;
}

export const DoctorVacationListItem: React.FC<Props> = ({ doctor, vacation }) => {
  return (
    <ListItem alignItems="flex-start">
      <ListItemText
        primary={
          <Typography variant="subtitle1">
            {doctor.surname} {doctor.name}
          </Typography>
        }
        secondary={
          <Typography variant="body2">
            {dayjs(vacation.startDate).format('DD MMM YYYY')} - {dayjs(vacation.endDate).format('DD MMM YYYY')}
          </Typography>
        }
      />
      <DeleteVacationButton vacation={vacation} />
    </ListItem>
  );
};
