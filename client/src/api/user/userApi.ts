import { apiSlice } from '../apiSlice';
import { User } from './types';

interface UserDto {
  user: User;
}
export const userApi = apiSlice.injectEndpoints({
  endpoints: (builder) => ({
    getUser: builder.query<UserDto, void>({
      query: () => ({
        url: 'api/user',
      }),
      keepUnusedDataFor: 0,
    }),
  }),
});

export const { useGetUserQuery } = userApi;
