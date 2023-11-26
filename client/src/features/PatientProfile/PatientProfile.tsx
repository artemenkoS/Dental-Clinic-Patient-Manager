import { Grid, Modal, Table, TableBody, TableCell, TableHead, TableRow, Typography } from '@mui/material';

import { useGetOnePatientQuery } from '../../api/patient/patientApi';
import { useGetProceduresQuery } from '../../api/procedure/procedureApi';
import { useGetAllUsersQuery } from '../../api/user/userApi';
import { useGetVisitsQuery } from '../../api/visit/visitApi';
import { Loader } from '../../components/Loader/Loader';
import { useAppDispatch, useAppSelector } from '../../store/hooks';
import {
  patientProfileModalSelector,
  setPatientProfile,
  setPatientProfileModalOpened,
} from '../../store/slices/modalsSlice';
import { formatVisitsData } from './helpers';
import { Container } from './styled';

export const PatientProfile = () => {
  const dispatch = useAppDispatch();
  const state = useAppSelector(patientProfileModalSelector);
  const {
    data: patient,
    isLoading: isPatientLoading,
    isFetching: isPatientFetching,
  } = useGetOnePatientQuery(state.patientId ?? 0, { skip: !state.patientId });

  const {
    data: visits,
    isLoading: isVisitsLoading,
    isFetching: isVisitsFetching,
  } = useGetVisitsQuery({ patientId: state.patientId?.toString() }, { skip: !state.patientId });

  const { data: users } = useGetAllUsersQuery();

  const handleClose = () => {
    dispatch(setPatientProfileModalOpened(false));
    dispatch(setPatientProfile(null));
  };

  const visitsData = formatVisitsData(visits?.data ?? [], users?.data ?? []);

  return (
    <Modal open={state.isOpen} onClose={handleClose}>
      <Container>
        {isPatientLoading || isPatientFetching || isVisitsLoading || isVisitsFetching ? (
          <Loader />
        ) : (
          <Grid container gap={2} direction={'column'}>
            <Grid item>
              <Typography variant="h5">
                {patient?.data.name} {patient?.data.surname}
              </Typography>
            </Grid>
            <Grid item>
              <Typography>Номер телефона: {patient?.data.phone}</Typography>
            </Grid>
            <Typography>История посещений</Typography>
            <Table>
              <TableHead>
                <TableRow>
                  <TableCell>Дата</TableCell>
                  <TableCell>Процедура</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {visitsData.map((visit) => (
                  <TableRow key={visit.id}>
                    <TableCell>{visit.visitDate}</TableCell>
                    <TableCell>{visit.procedure}</TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </Grid>
        )}
      </Container>
    </Modal>
  );
};
