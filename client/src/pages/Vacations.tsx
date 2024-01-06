import { List } from '@mui/material';

import { useGetDoctorsQuery } from '../api/doctor/doctorApi';
import { useGetVacationsQuery } from '../api/vacation/vacationApi';
import { DeleteVacationModal } from '../features/DeleteVacationModal/DeleteVacationModal';
import { NewVacation } from '../features/NewVacation/NewVacation';
import { NewVacationButton } from '../features/VacationForm/NewVacationButton';
import { VacationForm } from '../features/VacationForm/VacationForm';
import { DoctorVacationListItem } from '../features/VacationListItem/VacationListItem';

export const Vacations = () => {
  const { data: vacations } = useGetVacationsQuery();
  const { data: doctors } = useGetDoctorsQuery();

  return (
    <>
      <div>Отпуск</div>
      <List>
        {vacations &&
          doctors &&
          vacations.data.map((vacation) => {
            const doctor = doctors.data.find((item) => item.id === vacation.doctorId);
            return doctor && <DoctorVacationListItem key={vacation.id} doctor={doctor} vacation={vacation} />;
          })}
      </List>
      <NewVacationButton />
      <NewVacation />
      <DeleteVacationModal />
    </>
  );
};
