import { DevTool } from '@hookform/devtools';
import { Button, CircularProgress, Grid, MenuItem, Modal } from '@mui/material';
import * as dayjs from 'dayjs';
import * as utc from 'dayjs/plugin/utc';
import * as React from 'react';
import { Controller, useForm } from 'react-hook-form';

import { useGetDoctorsQuery } from '../../api/doctor/doctorApi';
import { useCreateLogRecordMutation } from '../../api/history/historyApi';
import { useGetProceduresQuery } from '../../api/procedure/procedureApi';
import { useGetUserQuery } from '../../api/user/userApi';
import { VisitMutationBody } from '../../api/visit/types';
import { useGetVisitsQuery } from '../../api/visit/visitApi';
import { DatePicker } from '../../components/DatePicker/DatePicker';
import { FormSelect } from '../../components/FormSelect/FormSelect';
import { NewPatient } from '../../components/NewPatientForm/NewPatientForm';
import { PatientAutocomplete } from '../../components/PatientAutocomplete/PatientAutocomplete';
import { useAppDispatch, useAppSelector } from '../../store/hooks';
import {
  editVisitModalSelector,
  logStatusSelector,
  setEditableVisit,
  setEditVisitModalOpened,
} from '../../store/slices/modalsSlice';
import { selectedSlotSelector, setSelectedSlot } from '../../store/slices/visitSlice';
import { setBusySlots } from '../../store/slices/visitSlice';
import { AutocompleteOption } from '../../types';
import { Container } from './styled';

interface FormValues {
  visitDate: Date;
  patient: AutocompleteOption | null;
  doctorId: string;
  procedureId: string;
  authorId: string;
  id?: number | undefined;
}

interface Props {
  mutate: (data: { body: VisitMutationBody; id: number }) => void;

  values?: FormValues;
}

export const VisitForm: React.FC<Props> = ({ mutate, values }) => {
  const isOpen = useAppSelector(editVisitModalSelector).isOpen;
  const dispatch = useAppDispatch();

  const handleClose = () => {
    dispatch(setEditVisitModalOpened(false));
    dispatch(setSelectedSlot(null));
    dispatch(setBusySlots(null));
    dispatch(setEditableVisit(null));

    resetForm();
  };

  dayjs.extend(utc);
  const selectedTimeSlot = useAppSelector(selectedSlotSelector);

  const defaulFormValues: FormValues = {
    doctorId: '',
    patient: null,
    procedureId: '',
    visitDate: new Date(),
    authorId: '',
  };

  const {
    handleSubmit,
    control,
    watch,
    reset: resetForm,
    formState: { isValid },
  } = useForm<FormValues>({ defaultValues: values ?? defaulFormValues });

  const { data: user, isLoading: isUserLoading } = useGetUserQuery();

  const { data: doctors, isLoading: isDoctorsloading } = useGetDoctorsQuery();
  const { data: procedures, isLoading: isProceduresLoading } = useGetProceduresQuery();
  const { submitText } = useAppSelector(editVisitModalSelector);
  const logStatus = useAppSelector(logStatusSelector);

  const [createLogRecordMutate] = useCreateLogRecordMutation();

  const formValues = watch();

  useGetVisitsQuery(
    {
      doctorId: formValues.doctorId,
      startDate: dayjs(formValues.visitDate).format('YYYY-MM-DD'),
    },
    { skip: !formValues.doctorId }
  );

  const onSubmit = (data: FormValues) => {
    if (user && data.patient) {
      const time = selectedTimeSlot ? selectedTimeSlot.split(':') : ['0', '0'];
      data.visitDate.setHours(+time[0]);
      data.visitDate.setMinutes(+time[1]);

      console.log(time[0], time[1]);
      console.log(data.visitDate);

      mutate({
        body: {
          doctorId: +data.doctorId,
          authorId: user.user.id,
          visitDate: `${dayjs(data.visitDate).utc().format('YYYY-MM-DD HH:mm')}`,
          patientId: +data.patient.id,
          procedureId: +data.procedureId,
        },
        id: values?.id,
      });
      createLogRecordMutate({
        doctorId: +data.doctorId,
        authorId: user.user.id,
        visitDate: `${dayjs(data.visitDate).utc().format('YYYY-MM-DD HH:mm')}`,
        changes: {
          doctorId: +data.doctorId,
          authorId: user.user.id,
          visitDate: `${dayjs(data.visitDate).utc().format('YYYY-MM-DD HH:mm')}`,
          patientId: +data.patient.id,
          procedureId: +data.procedureId,
        },
        status: logStatus,
      });
      resetForm(defaulFormValues);
      handleClose();
    }
  };

  if (isUserLoading || isDoctorsloading || isProceduresLoading) {
    return <CircularProgress />;
  }

  return (
    <div>
      <Modal open={isOpen} onClose={handleClose}>
        <Container>
          <form onSubmit={handleSubmit(onSubmit)}>
            <Grid container direction="column" spacing={2}>
              <Grid item>
                <Controller
                  name="doctorId"
                  rules={{ required: 'Доктор не выбран' }}
                  control={control}
                  render={({ field }) => (
                    <FormSelect label="Выберите доктора" {...field}>
                      {doctors?.data.map((doctor) => (
                        <MenuItem value={doctor.id.toString()}>
                          {doctor.name} {doctor.surname}
                        </MenuItem>
                      ))}
                    </FormSelect>
                  )}
                />
              </Grid>
              <Grid item>
                <Controller
                  name="procedureId"
                  control={control}
                  rules={{ required: 'Процедура не выбрана' }}
                  render={({ field }) => (
                    <FormSelect label="Выберите процедуру" {...field}>
                      {procedures?.data.map((procedure) => (
                        <MenuItem value={procedure.id.toString()}>{procedure.procedure}</MenuItem>
                      ))}
                    </FormSelect>
                  )}
                />
              </Grid>
              <Grid item xs={2}>
                <Controller
                  name="patient"
                  control={control}
                  rules={{ required: 'Пациент не выбран' }}
                  render={({ field }) => (
                    <PatientAutocomplete label="Выберите пациента" value={field.value} onChange={field.onChange} />
                  )}
                />
              </Grid>
            </Grid>
            <NewPatient />
            <Controller name="visitDate" control={control} render={({ field }) => <DatePicker {...field} />} />
            <Button type="submit" variant="outlined" fullWidth disabled={!isValid || !selectedTimeSlot}>
              {submitText}
            </Button>
          </form>
        </Container>
      </Modal>
      <DevTool control={control} />
    </div>
  );
};
