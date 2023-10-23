import toast from 'react-hot-toast';

import { AutocompleteOption } from '../../types';
import { apiSlice } from '../apiSlice';
import { Patient, PatientDto, PatientParams, PatientPayload } from './types';

export const userApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getPatients: builder.query<PatientDto, PatientParams>({
      query: (params: PatientParams) => ({
        url: 'api/patient',
        params,
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
        return rawResult.data.map((item) => ({
          id: item.id,
          label: `${item.name} ${item.surname}`,
        }));
      },
      keepUnusedDataFor: 0,
      providesTags: ['Patient'],
    }),
    getFormatedPatient: builder.query<AutocompleteOption, string>({
      query: (id) => ({
        url: `api/patient/${id}`,
        keepalive: false,
      }),
      transformResponse: (rawResult: { data: Patient }) => {
        return {
          id: rawResult.data.id,
          label: `${rawResult.data.name} ${rawResult.data.surname}`,
        };
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

export const {
  useGetPatientsQuery,
  useGetFormatedPatientsQuery,
  useGetFormatedPatientQuery,
  useCreatePatientMutation,
} = userApi;
