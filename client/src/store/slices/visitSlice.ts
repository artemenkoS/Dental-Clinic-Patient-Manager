import type { PayloadAction } from '@reduxjs/toolkit';
import { createSlice } from '@reduxjs/toolkit';

import { visitApi } from '../../api/visit/visitApi';
import { getBusySlots } from '../../helpers/getBusySlots';
import { RootState } from '../store';

interface VisitState {
  busySlots: Set<unknown> | null;
  selectedSlot: string | null;
}

const initialState: VisitState = { busySlots: null, selectedSlot: null };

const visitSlice = createSlice({
  name: 'visit',
  initialState,
  reducers: {
    setBusySlots(state, action: PayloadAction<Set<unknown> | null>) {
      state.busySlots = action.payload;
    },
    setSelectedSlot(state, action: PayloadAction<string | null>) {
      state.selectedSlot = action.payload;
    },
    resetSlots(state) {
      state.selectedSlot = null;
      state.busySlots = null;
    },
  },
  extraReducers: (builder) => {
    builder.addMatcher(visitApi.endpoints.getVisits.matchFulfilled, (state, { payload, meta }) => {
      if (meta.arg.originalArgs.doctorId) {
        state.busySlots = getBusySlots(payload.data);
        state.selectedSlot = null;
      }
    });
    builder.addMatcher(visitApi.endpoints.getVisits.matchRejected, (state, { meta }) => {
      if (meta.arg.originalArgs.doctorId) {
        state.busySlots = null;
        state.selectedSlot = null;
      }
    });
  },
});

export const { setBusySlots, setSelectedSlot, resetSlots } = visitSlice.actions;

export const busySlotsSelector = (state: RootState) => state.visitReducer.busySlots;
export const selectedSlotSelector = (state: RootState) => state.visitReducer.selectedSlot;
export default visitSlice.reducer;
