import { apiSlice } from '../apiSlice';
import { PaymentMethod } from './types';

interface RolesDto {
  data: PaymentMethod[];
}
export const rolesApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getPaymentMethods: builder.query<RolesDto, void>({
      query: () => ({
        url: 'api/paymentMethods',
      }),
    }),
  }),
});

export const { useGetPaymentMethodsQuery } = rolesApi;
