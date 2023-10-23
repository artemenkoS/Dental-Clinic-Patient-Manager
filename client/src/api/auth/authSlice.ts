import { createSlice } from '@reduxjs/toolkit';
import { toast } from 'react-hot-toast';

import { authApi } from './authApi';
import { AuthResponse } from './types';

interface User {
  user: AuthResponse['data'] | null;
}

const initialState: User = {
  user: null,
};

const userSlice = createSlice({
  name: 'auth',
  initialState,
  reducers: {},

  extraReducers: (builder) => {
    builder.addMatcher(authApi.endpoints.auth.matchFulfilled, (_, { payload }) => {
      localStorage.setItem('token', payload.token);

      toast.success('Успешная авторизация.');
    });
    builder.addMatcher(authApi.endpoints.auth.matchRejected, () => {
      localStorage.setItem('token', '');

      toast.error('Ошибка авторищации.');
    });
  },
});

export default userSlice.reducer;
