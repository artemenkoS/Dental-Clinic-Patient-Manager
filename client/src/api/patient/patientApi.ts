import toast from 'react-hot-toast';

import { AutocompleteOption } from '../../types';
import { apiSlice } from '../apiSlice';
import { PatientDto, PatientPayload } from './types';

export const userApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getPatients: builder.query<PatientDto, void>({
      query: () => ({
        url: 'api/patient',
      }),
      providesTags: ['Patient'],
    }),
    getFormatedPatients: builder.query<AutocompleteOption[], { search: string }>({
      query: (params) => ({
        url: 'api/patient',
        params,
        keepalive: false,
      }),
      transformResponse: (rawResult: PatientDto) => {
        return rawResult.data.map((item) => ({ id: item.id, label: `${item.name} ${item.surname}` }));
      },
      keepUnusedDataFor: 0,
      providesTags: ['Patient'],
    }),

    createPatient: builder.mutation<PatientDto, PatientPayload>({
      query: (body: PatientPayload) => ({
        body,
        url: 'api/patient',
        method: 'POST',
      }),
      invalidatesTags: ['Patient'],
      async onQueryStarted(_, { queryFulfilled }) {
        try {
          await queryFulfilled;
          toast.success('Пациент успешно добавлен');
        } catch (error) {
          toast.error('Не удалось добавить пациента.');
        }
      },
    }),
  }),
});

export const { useGetPatientsQuery, useGetFormatedPatientsQuery, useCreatePatientMutation } = userApi;
