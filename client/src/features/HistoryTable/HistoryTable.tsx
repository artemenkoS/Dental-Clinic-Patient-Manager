import { CircularProgress } from '@mui/material';
import { GridColDef, GridPaginationModel } from '@mui/x-data-grid';
import dayjs from 'dayjs';
import ru from 'dayjs/locale/ru';
import React from 'react';

import { useGetHistoryQuery } from '../../api/history/historyApi';
import { useGetAllUsersQuery } from '../../api/user/userApi';
import { PaginatedTable } from '../../components/PaginatedTable/PaginatedTable';
import { useAppDispatch, useAppSelector } from '../../store/hooks';
import { patientsTableCurrentPageSelector, setPatientsTableCurrentPage } from '../../store/slices/tablesSlice';
import { formatHistoryData } from './helpers';

dayjs.locale(ru);

export const HistoryTable = () => {
  const currentPage = useAppSelector(patientsTableCurrentPageSelector);
  const dispatch = useAppDispatch();

  const { data: history, isLoading } = useGetHistoryQuery({ page: currentPage + 1 ?? 1 });

  const { data: users } = useGetAllUsersQuery();

  const rows = React.useMemo(() => {
    if (history && users) {
      return formatHistoryData(history.data, users?.data);
    }
  }, [history, users]);

  const pagination = history?.pagination;

  const paginationModel = {
    page: pagination && pagination.currentPage - 1,
    pageSize: pagination?.pageSize,
  };

  const rowCount = pagination?.totalCount ?? 10;

  const onPaginationModelChange = (e: GridPaginationModel) => {
    dispatch(setPatientsTableCurrentPage(e.page));
  };

  const columns: GridColDef[] = [
    { field: 'status', headerName: 'Статус', width: 130 },
    { field: 'author', headerName: 'Автор', width: 150 },
    { field: 'doctor', headerName: 'Доктор', width: 150 },
    { field: 'visitDate', headerName: 'Время записи', width: 150 },
    { field: 'changes', headerName: 'Изменения', width: 500 },
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
