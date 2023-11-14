import { GridPaginationModel, GridSortModel } from '@mui/x-data-grid';
import type { PayloadAction } from '@reduxjs/toolkit';
import { createSlice } from '@reduxjs/toolkit';

import { RootState } from '../store';

interface TablesState {
  patientsTable: { pagination: GridPaginationModel; sortModel: GridSortModel };
  historyTable: { pagination: GridPaginationModel; sortModel: GridSortModel };
  visitsTable: { pagination: GridPaginationModel; sortModel: GridSortModel };
}

const initialState: TablesState = {
  patientsTable: { pagination: { page: 0, pageSize: 10 }, sortModel: [] },
  historyTable: { pagination: { page: 0, pageSize: 10 }, sortModel: [] },
  visitsTable: { pagination: { page: 0, pageSize: 10 }, sortModel: [] },
};

const tablesSlice = createSlice({
  name: 'tables',
  initialState,
  reducers: {
    setPatientsTablePagination(state, action: PayloadAction<GridPaginationModel>) {
      state.patientsTable.pagination = action.payload;
    },
    setPatientsTableSortModel(state, action: PayloadAction<GridSortModel>) {
      state.patientsTable.sortModel = action.payload;
    },
    setVisitsTablePagination(state, action: PayloadAction<GridPaginationModel>) {
      state.visitsTable.pagination = action.payload;
    },
    setVisitsTableSortModel(state, action: PayloadAction<GridSortModel>) {
      state.visitsTable.sortModel = action.payload;
    },
    setHistoryTablePagination(state, action: PayloadAction<GridPaginationModel>) {
      state.historyTable.pagination = action.payload;
    },
    setHistoryTableSortModel(state, action: PayloadAction<GridSortModel>) {
      state.historyTable.sortModel = action.payload;
    },
  },
});

export const {
  setPatientsTablePagination,
  setPatientsTableSortModel,
  setHistoryTablePagination,
  setHistoryTableSortModel,
  setVisitsTablePagination,
  setVisitsTableSortModel,
} = tablesSlice.actions;

export const patientsTablePaginationSelector = (state: RootState) => state.tablesReducer.patientsTable.pagination;
export const patientsTableCurrentSortModelSelector = (state: RootState) => state.tablesReducer.patientsTable.sortModel;
export const historyTablePaginationSelector = (state: RootState) => state.tablesReducer.historyTable.pagination;
export const historyTableCurrentSortModelSelector = (state: RootState) => state.tablesReducer.historyTable.sortModel;
export const visitsTablePaginationSelector = (state: RootState) => state.tablesReducer.visitsTable.pagination;
export const visitsTableCurrentSortModelSelector = (state: RootState) => state.tablesReducer.visitsTable.sortModel;

export default tablesSlice.reducer;
