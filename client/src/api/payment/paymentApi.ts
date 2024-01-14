import { apiSlice } from '../apiSlice';
import { Payment, PaymentMethod, PaymentParams } from './types';

interface PaymentMethodsDto {
  data: PaymentMethod[];
}

interface PaymentDto {
  data: Payment[];
}
export const rolesApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getPaymentMethods: builder.query<PaymentMethodsDto, void>({
      query: () => ({
        url: 'api/paymentMethods',
      }),
    }),
    getPaymentsByVisit: builder.query<PaymentDto, PaymentParams>({
      query: (params: PaymentParams) => ({
        params: params,
        url: 'api/payment',
      }),
      providesTags: ['Payment'],
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

export const { useGetPaymentMethodsQuery, useGetPaymentsByVisitQuery, useCreatePaymentsMutation } = rolesApi;
