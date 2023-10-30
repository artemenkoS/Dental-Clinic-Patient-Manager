import { CircularProgress, Pagination, Typography } from '@mui/material';
import dayjs from 'dayjs';
import React, { useEffect, useState } from 'react';
import toast from 'react-hot-toast';

import { useGetDoctorsQuery } from '../../api/doctor/doctorApi';
import { useGetPatientsQuery } from '../../api/patient/patientApi';
import { useGetRolesQuery } from '../../api/role/rolesApi';
import { useGetVisitsQuery } from '../../api/visit/visitApi';
import { DaySelect } from '../../components/DaySelector/DaySelect';
import { useAppSelector } from '../../store/hooks';
import { userSelector } from '../../store/slices/authSlice';
import { visitDateSelector } from '../../store/slices/visitSlice';
import { DeleteVisitButton } from '../DeleteVisitModal/DeleteVisitButton';
import { EditVisitButton } from '../EditVisit/EditVisitButton';
import { ControlsContainer, Slot, VisitsContainer, VisitTime, Wrapper } from './styled';

export const VisitsToday = () => {
  const date = useAppSelector(visitDateSelector);

  const [page, setPage] = useState<number>(1);
  const user = useAppSelector(userSelector);
  const { data: roles } = useGetRolesQuery();

  const doctorRole = React.useMemo(() => {
    return roles?.data.find((role) => role.role === 'doctor');
  }, [roles]);

  const { data: visits, isLoading, isError } = useGetVisitsQuery({ startDate: date, page });
  const { data: doctors } = useGetDoctorsQuery();

  const handlePaginationChange = (_: React.ChangeEvent<unknown>, value: number) => {
    setPage(value);
  };

  const patientIdsSet: Set<number> = new Set();

  if (visits?.data) {
    visits.data.forEach((visit) => {
      patientIdsSet.add(visit.patientId);
    });
  }

  const patientIdsArray: Array<number> = Array.from(patientIdsSet);

  const { data: patients } = useGetPatientsQuery({ ids: patientIdsArray });

  useEffect(() => {
    if (!visits?.data && page > 1) {
      setPage((prev) => prev - 1);
    }
  }, [visits, page]);

  if (isLoading) {
    return <CircularProgress />;
  }

  if (isError) {
    toast.error('Не удалось загрузить список записей.');
  }

  if (!visits?.data) {
    return (
      <>
        <DaySelect />
        <Typography>{visits?.message}</Typography>
      </>
    );
  }

  return (
    <Wrapper>
      <DaySelect />
      <VisitsContainer>
        {doctors?.data.map((doctor) => {
          const filteredVisits = visits.data.filter((el) => el.doctorId === doctor.id);
          if (filteredVisits.length > 0) {
            return (
              <div key={doctor.id}>
                <Typography variant="h6">
                  {doctor.name} {doctor.surname}
                </Typography>
                {filteredVisits.map((visit) => {
                  const visitDate = new Date(visit.visitDate);
                  const formattedDate = dayjs(visitDate).format('HH:mm');
                  const patient = patients?.data.find((el) => el.id === visit.patientId);
                  return (
                    <Slot key={visit.id}>
                      <Typography>
                        <VisitTime> {formattedDate}</VisitTime> {patient?.surname}
                      </Typography>
                      <ControlsContainer>
                        <DeleteVisitButton
                          visit={visit}
                          disabled={user?.role === doctorRole?.id && visit.doctorId !== user?.id}
                        />
                        <EditVisitButton
                          visit={visit}
                          disabled={user?.role === doctorRole?.id && visit.doctorId !== user?.id}
                        />
                      </ControlsContainer>
                    </Slot>
                  );
                })}
              </div>
            );
          }
          return null;
        })}
      </VisitsContainer>
      <Pagination
        count={visits?.pagination.totalPages}
        page={page}
        variant="outlined"
        onChange={handlePaginationChange}
      />
    </Wrapper>
  );
};
