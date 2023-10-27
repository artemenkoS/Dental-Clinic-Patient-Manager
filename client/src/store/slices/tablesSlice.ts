import { GridSortModel } from '@mui/x-data-grid';
import type { PayloadAction } from '@reduxjs/toolkit';
import { createSlice } from '@reduxjs/toolkit';

import { RootState } from '../store';

interface TablesState {
  patientsTable: { currentPage: number; sortModel: GridSortModel };
  historyTable: { currentPage: number; sortModel: GridSortModel };
}

const initialState: TablesState = {
  patientsTable: { currentPage: 0, sortModel: [] },
  historyTable: { currentPage: 0, sortModel: [] },
};

const tablesSlice = createSlice({
  name: 'tables',
  initialState,
  reducers: {
    setPatientsTableCurrentPage(state, action: PayloadAction<number>) {
      state.patientsTable.currentPage = action.payload;
    },
    setPatientsTableSortModel(state, action: PayloadAction<GridSortModel>) {
      state.patientsTable.sortModel = action.payload;
    },
    setHistoryTableCurrentPage(state, action: PayloadAction<number>) {
      state.historyTable.currentPage = action.payload;
    },
    setHistoryTableSortModel(state, action: PayloadAction<GridSortModel>) {
      state.historyTable.sortModel = action.payload;
    },
  },
});

export const {
  setPatientsTableCurrentPage,
  setPatientsTableSortModel,
  setHistoryTableCurrentPage,
  setHistoryTableSortModel,
} = tablesSlice.actions;

export const patientsTableCurrentPageSelector = (state: RootState) => state.tablesReducer.patientsTable.currentPage;
export const patientsTableCurrentSortModelSelector = (state: RootState) => state.tablesReducer.patientsTable.sortModel;
export const historyTableCurrentPageSelector = (state: RootState) => state.tablesReducer.historyTable.currentPage;
export const historyTableCurrentSortModelSelector = (state: RootState) => state.tablesReducer.historyTable.sortModel;

export default tablesSlice.reducer;
