import { createSlice } from '@reduxjs/toolkit';
import { toast } from 'react-hot-toast';

import { RootState } from '../../store/store';
import { authApi } from './authApi';
import { AuthResponse } from './types';

interface User {
  user: AuthResponse['data'] | null;
  token: string | null;
  isAuthed: boolean;
}

const initialState: User = {
  user: null,
  isAuthed: false,
  token: null,
};

const userSlice = createSlice({
  name: 'auth',
  initialState,
  reducers: {},

  extraReducers: (builder) => {
    builder.addMatcher(authApi.endpoints.auth.matchFulfilled, (state, { payload }) => {
      state.isAuthed = true;
      localStorage.setItem('token', payload.token);

      toast.success('Успешная авторизация.');
    });
    builder.addMatcher(authApi.endpoints.auth.matchRejected, (state) => {
      state.isAuthed = false;
      localStorage.setItem('token', '');

      toast.error('Ошибка авторищации.');
    });
  },
});

export const selectIsAuthed = (state: RootState) => state.userReducer.isAuthed;
export default userSlice.reducer;
