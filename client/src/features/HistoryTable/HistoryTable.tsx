import { CircularProgress } from '@mui/material';
import { GridColDef, GridPaginationModel, GridSortModel } from '@mui/x-data-grid';
import dayjs from 'dayjs';
import ru from 'dayjs/locale/ru';
import React from 'react';

import { useGetHistoryQuery } from '../../api/history/historyApi';
import { useGetAllUsersQuery } from '../../api/user/userApi';
import { PaginatedTable } from '../../components/PaginatedTable/PaginatedTable';
import { useAppDispatch, useAppSelector } from '../../store/hooks';
import {
  historyTableCurrentSortModelSelector,
  historyTablePaginationSelector,
  setHistoryTablePagination,
  setHistoryTableSortModel,
} from '../../store/slices/tablesSlice';
import { formatHistoryData } from './helpers';

dayjs.locale(ru);

export const HistoryTable = () => {
  const pagination = useAppSelector(historyTablePaginationSelector);
  const dispatch = useAppDispatch();

  const sort = useAppSelector(historyTableCurrentSortModelSelector);

  const { data: history, isLoading } = useGetHistoryQuery({
    page: pagination.page + 1 ?? 1,
    pageSize: pagination.pageSize,
    sort: JSON.stringify(sort, null, 4),
  });

  const { data: users } = useGetAllUsersQuery();

  const rows = React.useMemo(() => {
    if (history && users) {
      return formatHistoryData(history.data, users?.data);
    }
  }, [history, users]);

  const paginationModel = {
    page: pagination.page - 1,
    pageSize: pagination?.pageSize,
  };

  const onSortModelChange = (e: GridSortModel) => {
    dispatch(setHistoryTableSortModel(e));
  };

  const rowCount = history?.pagination.totalCount;

  const onPaginationModelChange = (e: GridPaginationModel) => {
    dispatch(setHistoryTablePagination(e));
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
        rowCount={rowCount ?? 10}
        rows={rows}
        onPaginationChange={onPaginationModelChange}
        onSortModelChange={onSortModelChange}
      />
    )
  );
};
