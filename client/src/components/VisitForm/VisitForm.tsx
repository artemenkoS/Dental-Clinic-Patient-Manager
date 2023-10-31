import { DevTool } from '@hookform/devtools';
import { Button, CircularProgress, Grid, MenuItem, Modal } from '@mui/material';
import dayjs from 'dayjs';
import * as React from 'react';
import { Controller, useForm } from 'react-hook-form';

import { useGetDoctorsQuery } from '../../api/doctor/doctorApi';
import { useCreateLogRecordMutation } from '../../api/history/historyApi';
import { useGetProceduresQuery } from '../../api/procedure/procedureApi';
import { useGetRolesQuery } from '../../api/role/rolesApi';
import { VisitMutationBody } from '../../api/visit/types';
import { useGetVisitsQuery } from '../../api/visit/visitApi';
import { DatePicker } from '../../components/DatePicker/DatePicker';
import { FormSelect } from '../../components/FormSelect/FormSelect';
import { NewPatient } from '../../components/NewPatientForm/NewPatientForm';
import { PatientAutocomplete } from '../../components/PatientAutocomplete/PatientAutocomplete';
import { useAppDispatch, useAppSelector } from '../../store/hooks';
import { userSelector } from '../../store/slices/authSlice';
import { editVisitModalSelector, setEditableVisit, setEditVisitModalOpened } from '../../store/slices/modalsSlice';
import { resetSlots, selectedSlotSelector, visitDateSelector } from '../../store/slices/visitSlice';
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
  onSubmit: (body: VisitMutationBody, id?: number) => void;
  values?: FormValues;
}

export const VisitForm: React.FC<Props> = ({ onSubmit, values }) => {
  const user = useAppSelector(userSelector);

  const { data: doctors, isLoading: isDoctorsloading } = useGetDoctorsQuery();

  const { data: roles } = useGetRolesQuery();

  const doctorRole = React.useMemo(() => {
    return roles?.data.find((role) => role.role === 'doctor');
  }, [roles]);

  const doctor = React.useMemo(() => {
    if (doctorRole) {
      return doctors?.data.find((doctor) => doctor.id === user?.id);
    }
  }, [doctors, user]);

  const isOpen = useAppSelector(editVisitModalSelector).isOpen;
  const dispatch = useAppDispatch();

  const handleClose = () => {
    dispatch(setEditVisitModalOpened(false));
    dispatch(setEditableVisit(null));
    dispatch(resetSlots());

    resetForm();
  };
  const date = useAppSelector(visitDateSelector);
  const selectedTimeSlot = useAppSelector(selectedSlotSelector);

  console.log(new Date(date));

  const defaultFormValues: FormValues = {
    doctorId: doctor ? doctor.id.toString() : '',
    patient: null,
    procedureId: '',
    visitDate: new Date(date),
    authorId: '',
  };

  console.log(defaultFormValues);

  const {
    handleSubmit,
    control,
    watch,
    reset: resetForm,
    formState: { isValid },
  } = useForm<FormValues>({ defaultValues: values ?? defaultFormValues });

  React.useEffect(() => resetForm(defaultFormValues), [date]);

  const { data: procedures, isLoading: isProceduresLoading } = useGetProceduresQuery();
  const { submitText } = useAppSelector(editVisitModalSelector);

  const [createLogRecordMutate] = useCreateLogRecordMutation();

  const formValues = watch();

  useGetVisitsQuery(
    {
      doctorId: formValues.doctorId,
      startDate: dayjs(formValues.visitDate).format('YYYY-MM-DD'),
    },
    { skip: !formValues.doctorId }
  );

  const formSubmit = (data: FormValues) => {
    if (user && data.patient) {
      const time = selectedTimeSlot ? selectedTimeSlot.split(':') : ['0', '0'];
      data.visitDate.setHours(+time[0]);
      data.visitDate.setMinutes(+time[1]);

      onSubmit(
        {
          doctorId: +data.doctorId,
          authorId: user.id,
          visitDate: `${data.visitDate.toISOString()}`,
          patientId: +data.patient.id,
          procedureId: +data.procedureId,
        },
        values?.id
      );
      createLogRecordMutate({
        doctorId: +data.doctorId,
        authorId: user.id,
        visitDate: `${data.visitDate.toISOString()}`,
        changes: {
          doctorId: +data.doctorId,
          authorId: user.id,
          visitDate: `${data.visitDate.toISOString()}`,
          patientId: +data.patient.id,
          procedureId: +data.procedureId,
        },
        status: values?.id ? 'edit' : 'create',
        createdAt: new Date().toISOString(),
      });
      resetForm(defaultFormValues);
      handleClose();
    }
  };

  if (isDoctorsloading || isProceduresLoading) {
    return <CircularProgress />;
  }

  return (
    <div>
      <Modal open={isOpen} onClose={handleClose}>
        <Container>
          <form onSubmit={handleSubmit(formSubmit)}>
            <Grid container direction="column" spacing={2}>
              <Grid item>
                <Controller
                  name="doctorId"
                  rules={{ required: 'Доктор не выбран' }}
                  control={control}
                  render={({ field }) => (
                    <FormSelect label="Выберите доктора" {...field}>
                      {doctor ? (
                        <MenuItem value={doctor.id.toString()}>
                          {doctor.name} {doctor.surname}
                        </MenuItem>
                      ) : (
                        doctors?.data.map((doctor) => (
                          <MenuItem value={doctor.id.toString()}>
                            {doctor.name} {doctor.surname}
                          </MenuItem>
                        ))
                      )}
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
            <Controller
              name="visitDate"
              control={control}
              render={({ field }) => {
                console.log(field);
                return <DatePicker {...field} />;
              }}
            />
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
