import { configureStore } from '@reduxjs/toolkit';

import { apiSlice } from '../api/apiSlice';
import userReducer from '../api/auth/authSlice';
import modalReducer from './slices/modalsSlice';
import visitReducer from './slices/visitSlice';

export const store = configureStore({
  reducer: {
    userReducer: userReducer,
    modalReducer: modalReducer,
    visitReducer: visitReducer,
    [apiSlice.reducerPath]: apiSlice.reducer,
  },
  middleware: (getDefaultMiddleware) => getDefaultMiddleware().concat(apiSlice.middleware),
});

export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
