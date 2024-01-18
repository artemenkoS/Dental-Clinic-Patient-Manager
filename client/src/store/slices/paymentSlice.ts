import { createSlice, PayloadAction } from '@reduxjs/toolkit';

import { Payment } from '../../api/payment/types';

interface PaymentState {
  payments: Payment[];
}

const initialState: PaymentState = {
  payments: [],
};

const paymentSlice = createSlice({
  name: 'payment',
  initialState,
  reducers: {
    setPayments: (state, action: PayloadAction<Payment[]>) => {
      state.payments = action.payload;
    },
  },
});

export const { setPayments } = paymentSlice.actions;
export default paymentSlice.reducer;
