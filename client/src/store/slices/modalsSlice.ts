import type { PayloadAction } from '@reduxjs/toolkit';
import { createSlice } from '@reduxjs/toolkit';

import { RootState } from '../store';

interface ModalState {
  patientModal: { isOpen: boolean };
  deleteVisitModal: { isOpen: boolean; visitId: number | null };
}

const initialState: ModalState = {
  patientModal: { isOpen: false },
  deleteVisitModal: { isOpen: false, visitId: null },
};

const modalSlice = createSlice({
  name: 'modal',
  initialState,
  reducers: {
    setPatientModalOpened(state, action: PayloadAction<boolean>) {
      state.patientModal.isOpen = action.payload;
    },
    setDeleteVisitModalOpened(state, action: PayloadAction<boolean>) {
      state.deleteVisitModal.isOpen = action.payload;
    },
    setDeleteVisitId(state, action: PayloadAction<number | null>) {
      state.deleteVisitModal.visitId = action.payload;
    },
  },
});

export const { setPatientModalOpened, setDeleteVisitModalOpened, setDeleteVisitId } = modalSlice.actions;

export const patientModalSelector = (state: RootState) => state.modalReducer.patientModal;
export const deleteVisitModalSelector = (state: RootState) => state.modalReducer.deleteVisitModal;
export default modalSlice.reducer;
