import { CircularProgress } from '@mui/material';
import { GridColDef, GridPaginationModel, GridSortModel } from '@mui/x-data-grid';

import { useGetPatientsQuery } from '../../api/patient/patientApi';
import { PaginatedTable } from '../../components/PaginatedTable/PaginatedTable';
import { useAppDispatch, useAppSelector } from '../../store/hooks';
import {
  patientsTableCurrentSortModelSelector,
  patientsTablePaginationSelector,
  setPatientsTablePagination,
  setPatientsTableSortModel,
} from '../../store/slices/tablesSlice';

export const AllPatientsTable = () => {
  const pagination = useAppSelector(patientsTablePaginationSelector);
  const dispatch = useAppDispatch();

  const sort = useAppSelector(patientsTableCurrentSortModelSelector);

  const { data: patients, isLoading } = useGetPatientsQuery({
    page: pagination.page + 1 ?? 1,
    pageSize: pagination.pageSize,
    sort: JSON.stringify(sort),
  });

  const rows = patients?.data;
  const totalCount = patients?.pagination.totalCount;

  const paginationModel = {
    page: pagination.page,
    pageSize: pagination?.pageSize,
  };

  const onPaginationModelChange = (e: GridPaginationModel) => {
    dispatch(setPatientsTablePagination(e));
  };

  const onSortModelChange = (e: GridSortModel) => {
    dispatch(setPatientsTableSortModel(e));
  };

  const columns: GridColDef[] = [
    { field: 'name', headerName: 'Имя', width: 150 },
    { field: 'surname', headerName: 'Фамилия', width: 150 },
    { field: 'phone', headerName: 'Телефон', width: 150 },
  ];

  if (isLoading) {
    return <CircularProgress />;
  }

  return (
    rows &&
    pagination && (
      <PaginatedTable
        columns={columns}
        paginationModel={paginationModel}
        rowCount={totalCount ?? 10}
        rows={rows}
        onPaginationChange={onPaginationModelChange}
        onSortModelChange={onSortModelChange}
      />
    )
  );
};