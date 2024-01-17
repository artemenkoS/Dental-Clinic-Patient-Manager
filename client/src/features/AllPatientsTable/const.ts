import { GridColDef } from '@mui/x-data-grid';

export const PATIENT_COLUMNS: GridColDef[] = [
  { field: 'surname', headerName: 'Фамилия', flex: 1 },
  { field: 'name', headerName: 'Имя', flex: 1 },
  { field: 'phone', headerName: 'Телефон', flex: 1 },
];
