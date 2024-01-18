import { GridColDef } from '@mui/x-data-grid';

export const VISIT_COLUMNS: GridColDef[] = [
  { field: 'visitDate', headerName: 'Время', flex: 1 },
  { field: 'patientId', headerName: 'Пациент', flex: 1 },
  { field: 'doctorId', headerName: 'Доктор', flex: 1 },
  { field: 'authorId', headerName: 'Автор записи', flex: 1 },
  { field: 'procedure', headerName: 'Процедура', flex: 1 },
];
