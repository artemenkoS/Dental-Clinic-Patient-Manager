import type { PayloadAction } from '@reduxjs/toolkit';
import { createSlice } from '@reduxjs/toolkit';

import { Visit } from '../../api/visit/types';
import { RootState } from '../store';

interface ModalState {
  patientModal: { isOpen: boolean };
  deleteVisitModal: { isOpen: boolean; visitId: number | null };
  editVisitModal: { isOpen: boolean; editableVisit: Visit | null; submitText: string };
}

const initialState: ModalState = {
  patientModal: { isOpen: false },
  deleteVisitModal: { isOpen: false, visitId: null },
  editVisitModal: { isOpen: false, editableVisit: null, submitText: 'Создать запись' },
};

const modalsSlice = createSlice({
  name: 'modals',
  initialState,
  reducers: {
    setPatientModalOpened(state, action: PayloadAction<boolean>) {
      state.patientModal.isOpen = action.payload;
    },
    setEditVisitModalOpened(state, action: PayloadAction<boolean>) {
      state.editVisitModal.isOpen = action.payload;
    },
    setEditVisitModalSubmitText(state, action: PayloadAction<string>) {
      state.editVisitModal.submitText = action.payload;
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
  setEditVisitModalSubmitText,
} = modalsSlice.actions;

export const patientModalSelector = (state: RootState) => state.modalsReducer.patientModal;
export const editVisitModalSelector = (state: RootState) => state.modalsReducer.editVisitModal;
export const deleteVisitModalSelector = (state: RootState) => state.modalsReducer.deleteVisitModal;
export default modalsSlice.reducer;
