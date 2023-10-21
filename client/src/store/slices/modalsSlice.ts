import type { PayloadAction } from '@reduxjs/toolkit';
import { createSlice } from '@reduxjs/toolkit';

import { Visit } from '../../api/visit/types';
import { RootState } from '../store';

interface ModalState {
  patientModal: { isOpen: boolean };
  deleteVisitModal: { isOpen: boolean; visitId: number | null };
  editVisitModal: { isOpen: boolean; editableVisit: Visit | null };
}

const initialState: ModalState = {
  patientModal: { isOpen: false },
  deleteVisitModal: { isOpen: false, visitId: null },
  editVisitModal: { isOpen: false, editableVisit: null },
};

const modalSlice = createSlice({
  name: 'modal',
  initialState,
  reducers: {
    setPatientModalOpened(state, action: PayloadAction<boolean>) {
      state.patientModal.isOpen = action.payload;
    },
    setEditVisitModalOpened(state, action: PayloadAction<boolean>) {
      state.editVisitModal.isOpen = action.payload;
    },
    setEditableVisit(state, action: PayloadAction<Visit | null>) {
      state.editVisitModal.editableVisit = action.payload;
    },
    setDeleteVisitModalOpened(state, action: PayloadAction<boolean>) {
      state.deleteVisitModal.isOpen = action.payload;
    },
    setDeleteVisitId(state, action: PayloadAction<number | null>) {
      state.deleteVisitModal.visitId = action.payload;
    },
  },
});

export const {
  setPatientModalOpened,
  setDeleteVisitModalOpened,
  setDeleteVisitId,
  setEditVisitModalOpened,
  setEditableVisit,
} = modalSlice.actions;

export const patientModalSelector = (state: RootState) => state.modalReducer.patientModal;
export const editVisitModalSelector = (state: RootState) => state.modalReducer.editVisitModal;
export const deleteVisitModalSelector = (state: RootState) => state.modalReducer.deleteVisitModal;
export default modalSlice.reducer;
