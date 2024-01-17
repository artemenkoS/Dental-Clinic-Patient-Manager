import { apiSlice } from '../apiSlice';
import { Payment, PaymentMethod } from './types';

interface PaymentMethodsDto {
  data: PaymentMethod[];
}

export const rolesApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getPaymentMethods: builder.query<PaymentMethodsDto, void>({
      query: () => ({
        url: 'api/paymentMethods',
      }),
    }),

    updatePayment: builder.mutation<Payment, Payment>({
      query: (body: Payment) => ({
        body,
        url: 'api/payment',
        method: 'PATCH',
      }),
      invalidatesTags: ['Payment'],
    }),
    createPayments: builder.mutation<Payment, Payment[]>({
      query: (body: Payment[]) => ({
        body,
        url: 'api/payment',
        method: 'POST',
      }),
      invalidatesTags: ['Payment'],
    }),
  }),
});

export const { useGetPaymentMethodsQuery, useCreatePaymentsMutation } = rolesApi;
