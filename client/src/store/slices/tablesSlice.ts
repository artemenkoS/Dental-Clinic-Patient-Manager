import type { PayloadAction } from '@reduxjs/toolkit';
import { createSlice } from '@reduxjs/toolkit';

import { RootState } from '../store';

interface TablesState {
  patientsTable: { currentPage: number };
}

const initialState: TablesState = {
  patientsTable: { currentPage: 0 },
};

const tablesSlice = createSlice({
  name: 'tables',
  initialState,
  reducers: {
    setPatientsTableCurrentPage(state, action: PayloadAction<number>) {
      state.patientsTable.currentPage = action.payload;
    },
  },
});

export const { setPatientsTableCurrentPage } = tablesSlice.actions;

export const patientsTableCurrentPageSelector = (state: RootState) => state.tablesReducer.patientsTable.currentPage;
export default tablesSlice.reducer;
