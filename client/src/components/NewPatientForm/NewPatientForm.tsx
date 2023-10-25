import { Button, Grid, Modal, TextField, Typography } from '@mui/material';
import * as React from 'react';
import { useForm } from 'react-hook-form';

import { useCreatePatientMutation } from '../../api/patient/patientApi';
import { useAppDispatch } from '../../store/hooks';
import { useAppSelector } from '../../store/hooks';
import { patientModalSelector } from '../../store/slices/modalsSlice';
import { setPatientModalOpened } from '../../store/slices/modalsSlice';
import { StyledBox } from './styled';

interface FormValues {
  name: string;
  surname: string;
  phone: string;
}

export const NewPatient: React.FC = () => {
  const dispatch = useAppDispatch();

  const handleClose = () => {
    dispatch(setPatientModalOpened(false));
    resetForm();
  };

  const {
    handleSubmit,
    register,
    reset: resetForm,
  } = useForm<FormValues>({
    defaultValues: {
      name: '',
      surname: '',
      phone: '',
    },
  });

  const [mutate, { isSuccess: createPatientSuccess, reset }] = useCreatePatientMutation();

  const isOpen = useAppSelector(patientModalSelector).isOpen;

  React.useEffect(() => {
    if (createPatientSuccess) {
      reset();
      handleClose();
    }
  }, [createPatientSuccess]);

  const onSubmit = (data: FormValues) => {
    mutate({
      name: data.name,
      surname: data.surname,
      phone: data.phone,
    });
    resetForm();
  };

  return (
    <div>
      <Modal keepMounted open={isOpen} onClose={handleClose}>
        <StyledBox>
          <Grid container direction="column" gap={2}>
            <Grid item>
              <Typography variant="h6">Добавление пациента</Typography>
            </Grid>
            <form onSubmit={handleSubmit(onSubmit)}>
              <Grid container direction="column" gap={2}>
                <Grid item>
                  <TextField {...register('name')} required placeholder="Введите имя " fullWidth />
                </Grid>
                <Grid item>
                  <TextField {...register('surname')} required placeholder="Введите фамилию " fullWidth />
                </Grid>
                <Grid item>
                  <TextField {...register('phone')} required placeholder="Введите номер телефона " fullWidth />
                </Grid>
                <Button type="submit" variant="outlined" fullWidth>
                  Добавить пациента
                </Button>
              </Grid>
            </form>
          </Grid>
        </StyledBox>
      </Modal>
    </div>
  );
};
