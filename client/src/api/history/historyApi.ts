import { Pagination } from '../../types';
import { apiSlice } from '../apiSlice';
import { LogRecord } from './types';

interface VisitDto {
  user: LogRecord[];
  pagination: Pagination;
}

export const userApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getHistory: builder.query<VisitDto, void>({
      query: () => ({
        url: 'api/history',
      }),
      keepUnusedDataFor: 0,
    }),
    createLogRecord: builder.mutation<VisitDto, LogRecord>({
      query: (body: LogRecord) => ({
        url: 'api/history',
        body,
        method: 'POST',
      }),
    }),
  }),
});

export const { useGetHistoryQuery, useCreateLogRecordMutation } = userApi;
