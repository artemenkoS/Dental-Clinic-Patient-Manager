import { DevTool } from '@hookform/devtools';
import { Button, Checkbox, FormControlLabel, Grid, MenuItem, Modal, TextField, Typography } from '@mui/material';
import { DatePicker } from '@mui/x-date-pickers/DatePicker';
import dayjs, { Dayjs } from 'dayjs';
import * as React from 'react';
import { Controller, useForm } from 'react-hook-form';

import { useGetDoctorsQuery } from '../../api/doctor/doctorApi';
import { useCreateLogRecordMutation } from '../../api/history/historyApi';
import { useGetOnePatientQuery, useUpdatePatientMutation } from '../../api/patient/patientApi';
import { useGetPaymentMethodsQuery } from '../../api/payment/paymentApi';
import { useGetRolesQuery } from '../../api/role/rolesApi';
import { useGetDoctorVacationsQuery } from '../../api/vacation/vacationApi';
import { Procedure, VisitMutationBody } from '../../api/visit/types';
import { useGetVisitsQuery } from '../../api/visit/visitApi';
import { FormSelect } from '../../components/FormSelect/FormSelect';
import { Loader } from '../../components/Loader/Loader';
import { NewPatient } from '../../components/NewPatientForm/NewPatientForm';
import { PatientAutocomplete } from '../../components/PatientAutocomplete/PatientAutocomplete';
import TimeSlots from '../../components/TimeSlots/TimeSlots';
import { getDoctorRole } from '../../helpers/getDoctorRole';
import { useAppDispatch, useAppSelector } from '../../store/hooks';
import { userSelector } from '../../store/slices/authSlice';
import {
  editVisitModalSelector,
  setEditableVisit,
  setEditVisitModalOpened,
  setNewVisitModalOpened,
} from '../../store/slices/modalsSlice';
import {
  busySlotsSelector,
  selectedSlotSelector,
  setSelectedSlot,
  visitDateSelector,
} from '../../store/slices/visitSlice';
import { theme } from '../../styles/theme';
import { LogStatus } from '../../types';
import { ExtraProcedureForm } from '../ExtraProcedureForm/ExtraProcedureForm';
import ProceduresTable from '../ProceduresTable/ProceduresTable';
import { Container } from './styled';
import { VisitFormValues } from './types';

interface Props {
  onSubmit: (body: VisitMutationBody, id?: number) => void;
  values?: Partial<VisitFormValues> | null;
  status: LogStatus;
  isOpen: boolean;
}

export const VisitForm: React.FC<Props> = ({ onSubmit, values, status, isOpen }) => {
  const user = useAppSelector(userSelector);
  const { data: doctors, isLoading: isDoctorsloading } = useGetDoctorsQuery();

  const { data: roles } = useGetRolesQuery();
  const busySlots = new Set(useAppSelector(busySlotsSelector));

  const [extraProcedures, setExtraProcedures] = React.useState<Procedure[] | null>(values?.extraProcedures ?? null);

  const doctorRole = React.useMemo(() => getDoctorRole(roles?.data), [roles]);

  const doctor = React.useMemo(() => {
    if (doctorRole) {
      return doctors?.data.find((doctor) => doctor.id === user?.id);
    }
  }, [doctors, user]);

  const dispatch = useAppDispatch();

  const handleClose = () => {
    dispatch(status === 'edit' ? setEditVisitModalOpened(false) : setNewVisitModalOpened(false));
    dispatch(setEditableVisit(null));
    dispatch(setSelectedSlot(null));
    setExtraProcedures(null);
    resetForm();
  };
  const date = useAppSelector(visitDateSelector);
  const selectedTimeSlot = useAppSelector(selectedSlotSelector);
  const { data: paymentMethods } = useGetPaymentMethodsQuery();

  const handleExtraProceduresFormSubmit = (data: Procedure) => {
    setExtraProcedures((prev) => (prev ? [...prev, data] : [data]));
  };

  const defaultFormValues: VisitFormValues = {
    doctorId: doctor ? doctor.id.toString() : '',
    patient: null,
    procedure: '',
    visitDate: new Date(date ?? ''),
    authorId: '',
    isRemindRequired: false,
    extraProcedures: null,
    isPaid: false,
    paymentMethodId: '',
    credit: 0,
  };

  const {
    handleSubmit,
    control,
    watch,
    reset: resetForm,
    register,
    setValue,
    formState: { isValid },
  } = useForm<VisitFormValues>({ defaultValues: values ?? defaultFormValues });

  React.useEffect(() => {
    values?.extraProcedures && setExtraProcedures(values?.extraProcedures);
  }, [values]);

  const { submitText } = useAppSelector(editVisitModalSelector);

  const [createLogRecordMutate] = useCreateLogRecordMutation();

  const formValues = watch();
  const { data: patient, isSuccess: isGetPatientSuccess } = useGetOnePatientQuery(formValues.patient?.id ?? 0, {
    skip: !(formValues.patient && formValues.patient.id),
  });

  React.useEffect(() => {
    if (patient && typeof patient.data.credit === 'number') {
      setValue('credit', patient?.data?.credit);
    }
  }, [patient, isGetPatientSuccess]);

  React.useEffect(() => resetForm(values ?? defaultFormValues), [date, values]);

  const { data: vacations } = useGetDoctorVacationsQuery(formValues.doctorId, {
    skip: !values?.doctorId && !formValues.doctorId,
  });

  const [updatePatientMutation] = useUpdatePatientMutation();

  useGetVisitsQuery(
    {
      doctorId: formValues.doctorId,
      startDate: dayjs(formValues.visitDate).format('YYYY-MM-DD'),
    },
    { skip: !formValues.doctorId }
  );

  const formSubmit = (data: VisitFormValues) => {
    if (user && data.patient && patient?.data) {
      const time = selectedTimeSlot ? selectedTimeSlot.split(':') : ['0', '0'];
      const visitDate = dayjs(data.visitDate).hour(+time[0]).minute(+time[1]).second(0);

      onSubmit(
        {
          doctorId: +data.doctorId,
          authorId: user.id,
          visitDate: visitDate.toISOString(),
          patientId: +data.patient.id,
          procedure: data.procedure,
          isRemindRequired: data.isRemindRequired,
          extraProcedures: extraProcedures,
          isPaid: data.isPaid,
          paymentMethodId: +data.paymentMethodId,
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
          visitDate: visitDate.toISOString(),
          patientId: +data.patient.id,
          procedure: data.procedure,
        },
        status: status,
        createdAt: new Date().toISOString(),
      });
      console.log(data.credit, typeof data.credit);
      if (typeof data.credit === 'string') {
        updatePatientMutation({ ...patient.data, credit: +data.credit });
      }
      resetForm(defaultFormValues);
      handleClose();
    }
  };

  const isDateBlocked = (day: Dayjs) => {
    const date = dayjs(day);

    if (!vacations || !vacations.data || vacations.data.length === 0) {
      return false;
    }

    for (const { startDate, endDate } of vacations.data) {
      const parsedStartDate = dayjs(startDate);
      const parsedEndDate = dayjs(endDate);

      if (date.isSame(parsedStartDate, 'day') || date.isAfter(parsedStartDate, 'day')) {
        if (date.isSame(parsedEndDate, 'day') || date.isBefore(parsedEndDate, 'day')) {
          return true;
        }
      }
      if (date.day() === 0) {
        return true;
      }
    }

    return false;
  };

  if (isDoctorsloading) {
    return <Loader />;
  }

  return (
    <div>
      <Modal open={isOpen} onClose={handleClose}>
        <Container>
          <form onSubmit={handleSubmit(formSubmit)} id="visit">
            <Grid container direction="column" spacing={2}>
              <Grid item>
                <Controller
                  name="doctorId"
                  rules={{ required: 'Доктор не выбран' }}
                  control={control}
                  render={({ field }) => (
                    <FormSelect label="Выберите доктора" onChange={field.onChange} value={field.value}>
                      {doctor ? (
                        <MenuItem value={doctor?.id.toString()}>
                          {doctor.name} {doctor.surname}
                        </MenuItem>
                      ) : (
                        doctors?.data.map((doctor) => (
                          <MenuItem value={doctor.id.toString()} key={doctor.id}>
                            {doctor.name} {doctor.surname}
                          </MenuItem>
                        ))
                      )}
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
          </form>
          <Grid container direction="column" spacing={2}>
            <Grid item>
              <ExtraProcedureForm formSubmit={handleExtraProceduresFormSubmit} disabled={formValues.isPaid} />
            </Grid>
            <Grid item>
              {extraProcedures && extraProcedures.length > 0 && (
                <ProceduresTable
                  disabled={formValues.isPaid}
                  procedures={extraProcedures}
                  onDelete={(index) => {
                    const updatedProcedures = extraProcedures.filter((_, i) => i !== index);
                    setExtraProcedures(updatedProcedures);
                  }}
                />
              )}
            </Grid>
            <Grid item>
              <FormControlLabel
                control={
                  <Controller
                    name="isRemindRequired"
                    control={control}
                    render={({ field }) => (
                      <Checkbox checked={field.value} onChange={(e) => field.onChange(e.target.checked)} />
                    )}
                  />
                }
                label="Требуется напоминание"
              />
            </Grid>
            <Grid item>
              <Grid container gap={2}>
                <Grid item>
                  <Controller
                    name="visitDate"
                    control={control}
                    render={({ field }) => {
                      return (
                        <DatePicker
                          onChange={field.onChange}
                          value={dayjs(field.value).locale('ru')}
                          shouldDisableDate={isDateBlocked}
                          slotProps={{
                            day: {
                              sx: {
                                '&.MuiPickersDay-root.Mui-disabled': {
                                  color: theme.palette.error.light,
                                  opacity: 0.7,
                                },
                              },
                            },
                          }}
                        />
                      );
                    }}
                  />
                </Grid>
                <Grid>
                  <TimeSlots />
                </Grid>
              </Grid>
            </Grid>
            {!doctor && (
              <Grid item>
                <Grid container gap={2}>
                  <Grid item>
                    <TextField
                      type="number"
                      label="Долг"
                      InputLabelProps={{ shrink: true }}
                      {...register('credit')}
                      placeholder="Долг"
                    />
                  </Grid>
                  <Grid item xs>
                    <Controller
                      name="paymentMethodId"
                      control={control}
                      render={({ field }) => (
                        <FormSelect
                          label="Выберите способ оплаты"
                          onChange={field.onChange}
                          value={field.value}
                          disabled={values?.isPaid}
                        >
                          {paymentMethods?.data.map((paymentMethod) => (
                            <MenuItem value={paymentMethod.id.toString()} key={paymentMethod.id}>
                              {paymentMethod.label}
                            </MenuItem>
                          ))}
                        </FormSelect>
                      )}
                    />
                  </Grid>
                  <Grid item>
                    <FormControlLabel
                      control={
                        <Controller
                          name="isPaid"
                          control={control}
                          render={({ field }) => (
                            <Checkbox
                              checked={field.value}
                              onChange={(e) => field.onChange(e.target.checked)}
                              disabled={values?.isPaid}
                            />
                          )}
                        />
                      }
                      label="Визит оплачен"
                    />
                  </Grid>
                </Grid>
              </Grid>
            )}

            <Grid item>
              <Button
                type="submit"
                variant="outlined"
                fullWidth
                disabled={!isValid || !selectedTimeSlot || (status === 'create' && busySlots.has(selectedTimeSlot))}
                form="visit"
              >
                {submitText}
              </Button>
            </Grid>
          </Grid>
          <NewPatient />
        </Container>
      </Modal>
      {import.meta.env.DEV && <DevTool control={control} />}
    </div>
  );
};
