import { CircularProgress } from '@mui/material';
import { GridColDef, GridPaginationModel } from '@mui/x-data-grid';

import { useGetPatientsQuery } from '../../api/patient/patientApi';
import { PaginatedTable } from '../../components/PaginatedTable/PaginatedTable';
import { useAppDispatch, useAppSelector } from '../../store/hooks';
import { patientsTableCurrentPageSelector, setPatientsTableCurrentPage } from '../../store/slices/tablesSlice';

export const AllPatientsTable = () => {
  const currentPage = useAppSelector(patientsTableCurrentPageSelector);
  const dispatch = useAppDispatch();

  const { data: patients, isLoading } = useGetPatientsQuery({ page: currentPage + 1 ?? 1 });

  const rows = patients?.data;
  const pagination = patients?.pagination;

  const paginationModel = {
    page: pagination && pagination.currentPage - 1,
    pageSize: pagination?.pageSize,
  };

  console.log(paginationModel);

  const rowCount = pagination?.totalCount ?? 10;

  const onPaginationModelChange = (e: GridPaginationModel) => {
    dispatch(setPatientsTableCurrentPage(e.page));
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
        rowCount={rowCount}
        rows={rows}
        onPaginationChange={onPaginationModelChange}
      ></PaginatedTable>
    )
  );
};
