import CallIcon from '@mui/icons-material/Call';
import { Typography } from '@mui/material';
import dayjs from 'dayjs';
import React from 'react';
import toast from 'react-hot-toast';

import { useGetDoctorsQuery } from '../../api/doctor/doctorApi';
import { useGetPatientsQuery } from '../../api/patient/patientApi';
import { useGetRolesQuery } from '../../api/role/rolesApi';
import { useGetVisitsQuery } from '../../api/visit/visitApi';
import { DaySelect } from '../../components/DaySelector/DaySelect';
import { Loader } from '../../components/Loader/Loader';
import { createPatientsList } from '../../helpers/createPatientsList';
import { getDoctorRole } from '../../helpers/getDoctorRole';
import { useAppDispatch, useAppSelector } from '../../store/hooks';
import { userSelector } from '../../store/slices/authSlice';
import { setPatientProfile, setPatientProfileModalOpened } from '../../store/slices/modalsSlice';
import { visitDateSelector } from '../../store/slices/visitSlice';
import { DeleteVisitButton } from '../DeleteVisitModal/DeleteVisitButton';
import { EditVisitButton } from '../EditVisit/EditVisitButton';
import { ControlsContainer, Slot, VisitsContainer, VisitsWrapper, VisitTime, Wrapper } from './styled';

export const VisitsList = () => {
  const dispatch = useAppDispatch();
  const date = useAppSelector(visitDateSelector);

  const user = useAppSelector(userSelector);
  const { data: roles } = useGetRolesQuery();

  const doctorRole = React.useMemo(() => getDoctorRole(roles?.data), [roles]);

  const {
    data: visits,
    isFetching: isVisitsLoading,
    isError,
  } = useGetVisitsQuery({
    startDate: dayjs(date).format('YYYY-MM-DD'),
    sort: JSON.stringify([{ field: 'visitDate', sort: 'asc' }]),
  });
  const { data: doctors } = useGetDoctorsQuery();

  const patientIdsArray = createPatientsList(visits?.data);

  const { data: patients, isFetching: isPatientsLoading } = useGetPatientsQuery({ ids: patientIdsArray });

  if (isVisitsLoading || isPatientsLoading) {
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
        {doctors?.data.map((doctor) => {
          const filteredVisits = visits.data.filter((el) => el.doctorId === doctor.id);
          if (filteredVisits.length > 0) {
            return (
              <div key={doctor.id}>
                <Typography variant="h6">
                  {doctor.name} {doctor.surname}
                </Typography>
                <VisitsWrapper>
                  {filteredVisits.map((visit) => {
                    const visitDate = new Date(visit.visitDate);
                    const formattedDate = dayjs(visitDate).format('HH:mm');
                    const patient = patients?.data.find((el) => el.id === visit.patientId);
                    return (
                      patient && (
                        <Slot key={visit.id} elevation={4}>
                          <VisitTime> {formattedDate}</VisitTime>
                          <span
                            onClick={() => {
                              dispatch(setPatientProfile(patient.id));
                              dispatch(setPatientProfileModalOpened(true));
                            }}
                          >
                            {patient?.surname}
                          </span>
                          {visit.isRemindRequired && <CallIcon color="error" />}
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
                      )
                    );
                  })}
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
