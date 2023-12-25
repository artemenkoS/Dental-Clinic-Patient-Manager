import { Typography } from '@mui/material';
import dayjs from 'dayjs';
import { toast } from 'react-toastify';

import { useGetDoctorsQuery } from '../../api/doctor/doctorApi';
import { Doctor } from '../../api/doctor/types';
import { useGetUserQuery } from '../../api/user/userApi';
import { useGetVisitsQuery } from '../../api/visit/visitApi';
import { DaySelect } from '../../components/DaySelector/DaySelect';
import { HourSlots } from '../../components/HourSlots/HourSlots';
import { Loader } from '../../components/Loader/Loader';
import { useAppSelector } from '../../store/hooks';
import { visitDateSelector } from '../../store/slices/visitSlice';
import { VisitsContainer, VisitsWrapper, Wrapper } from './styled';

export const VisitsList = () => {
  const date = useAppSelector(visitDateSelector);
  const { data: user } = useGetUserQuery();

  const {
    data: visits,
    isFetching: isVisitsLoading,
    isError,
  } = useGetVisitsQuery({
    startDate: dayjs(date).format('YYYY-MM-DD'),
    sort: JSON.stringify([{ field: 'visitDate', sort: 'asc' }]),
  });
  const { data: doctors } = useGetDoctorsQuery();

  const sortedDoctorsByCabinet = (docData: Doctor[]) => {
    if (user?.user.cabinet === 0) {
      return docData;
    }

    return docData.filter((item) => item.cabinet === user?.user.cabinet);
  };

  console.log(user);
  if (!user?.user || !doctors?.data) {
    return <Loader />;
  }
  const sortedDoctors = sortedDoctorsByCabinet(doctors.data);
  console.log(sortedDoctors);

  if (isVisitsLoading) {
    return <Loader />;
  }

  if (isError) {
    toast.error('Не удалось загрузить список записей.');
  }

  if (!visits?.data) {
    return (
      <>
        <DaySelect />
        <Typography
          variant="h4"
          sx={{ position: 'absolute', top: '50%', left: '50%', transform: 'translate(-50%, -50%)' }}
        >
          {visits?.message}
        </Typography>
      </>
    );
  }

  return (
    <Wrapper>
      <DaySelect />
      <VisitsContainer>
        {sortedDoctors.map((doctor) => {
          const filteredVisits = visits.data.filter((el) => el.doctorId === doctor.id);
          if (filteredVisits.length > 0) {
            return (
              <div key={doctor.id} style={{ maxWidth: 520 }}>
                <Typography variant="h6">
                  {doctor.name} {doctor.surname}
                </Typography>

                <VisitsWrapper>
                  <HourSlots visits={filteredVisits} />
                </VisitsWrapper>
              </div>
            );
          }
          return null;
        })}
      </VisitsContainer>
    </Wrapper>
  );
};
