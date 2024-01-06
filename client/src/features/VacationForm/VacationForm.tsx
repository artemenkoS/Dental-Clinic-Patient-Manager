import { Button, Grid, MenuItem, Modal } from '@mui/material';
import { DatePicker } from '@mui/x-date-pickers';
import dayjs from 'dayjs';
import { Controller, useForm } from 'react-hook-form';

import { useGetDoctorsQuery } from '../../api/doctor/doctorApi';
import { VacationMutationBody } from '../../api/vacation/types';
import { FormSelect } from '../../components/FormSelect/FormSelect';
import { useAppDispatch, useAppSelector } from '../../store/hooks';
import { setVacationModalOpened, vacationModalSelector } from '../../store/slices/modalsSlice';
import { LogStatus } from '../../types';
import { Container } from './styled';
import { VacationFormValues } from './types';

interface Props {
  onSubmit: (body: VacationMutationBody, id?: number) => void;
  values?: Partial<VacationFormValues> | null;
  status: LogStatus;
  isOpen: boolean;
}

export const VacationForm: React.FC<Props> = ({ isOpen, onSubmit }) => {
  const dispatch = useAppDispatch();
  const { data: doctors } = useGetDoctorsQuery();

  const defaultFormValues: VacationFormValues = {
    doctorId: '',
    startDate: new Date(),
    endDate: new Date(),
  };

  const { handleSubmit, control, reset } = useForm<VacationFormValues>({ defaultValues: defaultFormValues });

  const handleClose = () => {
    dispatch(setVacationModalOpened(false));
    reset(defaultFormValues);
  };

  const formSubmit = (data: VacationFormValues) => {
    onSubmit({
      doctorId: +data.doctorId,
      startDate: data.startDate?.toISOString() || '',
      endDate: data.endDate?.toISOString() || '',
    });

    reset(defaultFormValues);
    handleClose();
  };

  const { submitText } = useAppSelector(vacationModalSelector);

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
                    <FormSelect label="Выберите доктора" onChange={field.onChange} value={field.value}>
                      {doctors?.data.map((doctor) => (
                        <MenuItem value={doctor.id.toString()} key={doctor.id}>
                          {doctor.name} {doctor.surname}
                        </MenuItem>
                      ))}
                    </FormSelect>
                  )}
                />
              </Grid>
              <Grid item>
                <Controller
                  name="startDate"
                  control={control}
                  render={({ field }) => {
                    return <DatePicker onChange={field.onChange} value={dayjs(field.value).locale('ru')} />;
                  }}
                />
              </Grid>
              <Grid item>
                <Controller
                  name="endDate"
                  control={control}
                  render={({ field }) => (
                    <DatePicker
                      label="Выберите конечную дату"
                      value={dayjs(field.value).locale('ru')}
                      onChange={field.onChange}
                    />
                  )}
                />
              </Grid>
              <Button type="submit" variant="outlined" fullWidth>
                {submitText}
              </Button>
            </Grid>
          </form>
        </Container>
      </Modal>
    </div>
  );
};
