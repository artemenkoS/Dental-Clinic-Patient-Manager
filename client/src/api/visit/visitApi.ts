import toast from 'react-hot-toast';

import { setBusySlots, setSelectedSlot } from '../../store/slices/visitSlice';
import { apiSlice } from '../apiSlice';
import { VisitDto, VisitMutationBody, VisitParams } from './types';

export const visitApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getVisits: builder.query<VisitDto, VisitParams>({
      query: (params: VisitParams) => ({
        params: params,
        url: 'api/visit',
      }),
      providesTags: ['Visit'],
      keepUnusedDataFor: 0,
    }),

    createVisit: builder.mutation<VisitDto, VisitMutationBody>({
      query: (body: VisitMutationBody) => ({
        body,
        url: 'api/visit',
        method: 'POST',
      }),
      invalidatesTags: ['Visit'],
      async onQueryStarted(_, { dispatch, queryFulfilled }) {
        try {
          await queryFulfilled;
          dispatch(setBusySlots(null));
          dispatch(setSelectedSlot(null));
          toast.success('Запись успешно создана.');
        } catch (error) {
          toast.error('Не удалось создать запись.');
        }
      },
    }),
    deleteVisit: builder.mutation<VisitDto, number>({
      query: (id: number) => ({
        url: `api/visit/${id}`,
        method: 'DELETE',
      }),
      invalidatesTags: ['Visit'],
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

export const { useGetVisitsQuery, useCreateVisitMutation, useLazyGetVisitsQuery, useDeleteVisitMutation } = visitApi;
