import { toast } from 'react-toastify';

import { setEditableVisit } from '../../store/slices/modalsSlice';
import { resetSlots } from '../../store/slices/visitSlice';
import { apiSlice } from '../apiSlice';
import { VacationDto, VacationMutationBody } from './types';

export const vacationApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getDoctorVacations: builder.query<VacationDto, string>({
      query: (id: string) => ({
        url: `api/vacation/${id}`,
      }),
      providesTags: ['Vacation'],
      keepUnusedDataFor: 0,
    }),
    getVacations: builder.query<VacationDto, void>({
      query: () => ({
        url: `api/vacation/`,
      }),
      providesTags: ['Vacation'],
      keepUnusedDataFor: 0,
    }),

    createVacation: builder.mutation<VacationDto, { body: VacationMutationBody }>({
      query: ({ body }) => ({
        body,
        url: 'api/vacation',
        method: 'POST',
      }),
      invalidatesTags: ['Vacation'],
      async onQueryStarted(_, { dispatch, queryFulfilled }) {
        try {
          await queryFulfilled;
          dispatch(resetSlots());
          toast.success('Запись успешно создана.');
        } catch (error) {
          toast.error('Не удалось создать запись.');
        }
      },
    }),
    updateVacation: builder.mutation<VacationDto, { body: VacationMutationBody; id: number }>({
      query: ({ body, id }) => ({
        body,
        url: `api/vacation/${id}`,
        method: 'PATCH',
      }),
      invalidatesTags: ['Vacation'],
      async onQueryStarted(_, { dispatch, queryFulfilled }) {
        try {
          await queryFulfilled;
          dispatch(resetSlots());
          dispatch(setEditableVisit(null));
          toast.success('Запись успешно изменена.');
        } catch (error) {
          toast.error('Не удалось изменить запись.');
        }
      },
    }),

    deleteVacation: builder.mutation<VacationDto, number>({
      query: (id: number) => ({
        url: `api/vacation/${id}`,
        method: 'DELETE',
      }),
      invalidatesTags: ['Vacation'],
      async onQueryStarted(_, { queryFulfilled }) {
        try {
          await queryFulfilled;
          toast.success('Запись успешно удалена.');
        } catch (error) {
          toast.error('Не удалось удалить запись.');
        }
      },
    }),
  }),
});

export const {
  useGetDoctorVacationsQuery,
  useCreateVacationMutation,
  useUpdateVacationMutation,
  useDeleteVacationMutation,
  useGetVacationsQuery,
} = vacationApi;
