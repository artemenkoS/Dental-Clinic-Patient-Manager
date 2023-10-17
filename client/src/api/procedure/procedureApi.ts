import { apiSlice } from '../apiSlice';
import { ProcedureDto } from './types';

export const userApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getProcedures: builder.query<ProcedureDto, void>({
      query: () => ({
        url: 'api/procedure',
      }),
    }),
  }),
});

export const { useGetProceduresQuery } = userApi;
