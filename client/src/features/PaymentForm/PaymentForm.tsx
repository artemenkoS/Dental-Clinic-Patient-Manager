import AddIcon from '@mui/icons-material/Add';
import Delete from '@mui/icons-material/Delete';
import { Button, Grid, IconButton, MenuItem, TextField } from '@mui/material';
import React, { useState } from 'react';
import { Control, Controller } from 'react-hook-form';

import { useGetPaymentMethodsQuery } from '../../api/payment/paymentApi';
import { Payment } from '../../api/payment/types';
import { FormSelect } from '../../components/FormSelect/FormSelect';
import { VisitFormValues } from '../VisitForm/types';

interface Props {
  formSubmit: (data: Omit<Payment, 'id'>[]) => void;
  disabled?: boolean;
  initialPayments?: Omit<Payment, 'id' | 'visitId'>[];
  control: Control<VisitFormValues, unknown>;
}

export const PaymentForm: React.FC<Props> = ({ disabled, initialPayments, control }) => {
  const [payments, setPayments] = useState<Omit<Payment, 'id' | 'visitId'>[]>(initialPayments ?? []);

  const { data: paymentMethods } = useGetPaymentMethodsQuery();

  const handlePaymentMethodChange = (index: number, value: string) => {
    const updatedPayments = [...payments];
    updatedPayments[index].paymentMethodId = parseInt(value, 10);
    setPayments(updatedPayments);
  };

  const handleAmountChange = (index: number, value: string) => {
    const updatedPayments = [...payments];
    updatedPayments[index].amount = parseFloat(value);
    setPayments(updatedPayments);
  };

  const handleRemovePayment = (index: number) => {
    const updatedPayments = [...payments];
    updatedPayments.splice(index, 1);
    setPayments(updatedPayments);
  };

  const handleAddPayment = () => {
    setPayments((prevPayments) => [...prevPayments, { paymentMethodId: 0, amount: 0 }]);
  };

  return (
    <Grid container spacing={2}>
      {payments.map((_, index) => (
        <Grid container item key={index} spacing={2} alignItems="center">
          <Grid item xs={5}>
            <Controller
              name={`payments.${index}.paymentMethodId`}
              control={control}
              defaultValue={initialPayments?.[index]?.paymentMethodId || 0}
              render={({ field }) => (
                <FormSelect
                  disabled={disabled}
                  label="Выберите способ оплаты"
                  onChange={(e) => {
                    field.onChange(e);
                    handlePaymentMethodChange(index, e);
                  }}
                  value={field.value?.toString()}
                >
                  {paymentMethods?.data.map((paymentMethod) => (
                    <MenuItem value={paymentMethod?.id.toString()} key={paymentMethod.id}>
                      {paymentMethod.label}
                    </MenuItem>
                  ))}
                </FormSelect>
              )}
            />
          </Grid>
          <Grid item>
            <Controller
              name={`payments.${index}.amount`}
              control={control}
              defaultValue={initialPayments?.[index]?.amount || 0}
              render={({ field }) => (
                <TextField
                  type="number"
                  label="Сумма"
                  variant="outlined"
                  disabled={disabled}
                  fullWidth
                  value={field.value}
                  onChange={(e) => {
                    field.onChange(e);
                    handleAmountChange(index, e.target.value);
                  }}
                />
              )}
            />
          </Grid>
          {!disabled && (
            <Grid item>
              <IconButton onClick={() => handleRemovePayment(index)}>
                <Delete />
              </IconButton>
            </Grid>
          )}
        </Grid>
      ))}
      {!disabled && (
        <Grid item>
          <Button variant="outlined" onClick={handleAddPayment} startIcon={<AddIcon />}>
            Добавить метод оплаты
          </Button>
        </Grid>
      )}
    </Grid>
  );
};
