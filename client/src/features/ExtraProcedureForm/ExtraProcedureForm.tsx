import { Button, Grid, TextField } from '@mui/material';
import { useForm } from 'react-hook-form';

import { Procedure } from '../../api/visit/types';

interface Props {
  formSubmit: (data: Procedure) => void;
  disabled?: boolean;
}

interface FormValues {
  label: string;
  sum: number;
}
const defaultFormValues = {
  label: '',
  sum: undefined,
};

export const ExtraProcedureForm: React.FC<Props> = ({ formSubmit, disabled }) => {
  const { register, handleSubmit, reset, watch } = useForm<FormValues>({ defaultValues: defaultFormValues });

  const values = watch();

  const onSubmit = (data: FormValues) => {
    formSubmit(data);
    reset(defaultFormValues);
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <Grid container gap={2} alignItems="center">
        <Grid item>
          <TextField {...register('label')} placeholder="Название процедуры" disabled={disabled} />
        </Grid>
        <Grid item>
          <TextField {...register('sum')} placeholder="Стоимость" type="number" disabled={disabled} />
        </Grid>
        <Grid item>
          <Button type="submit" variant="outlined" disabled={!values.label}>
            Добавить
          </Button>
        </Grid>
      </Grid>
    </form>
  );
};
