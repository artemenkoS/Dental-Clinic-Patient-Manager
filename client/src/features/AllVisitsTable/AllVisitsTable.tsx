import { GridColDef, GridPaginationModel, GridSortModel } from '@mui/x-data-grid';
import React from 'react';

import { useGetPatientsQuery } from '../../api/patient/patientApi';
import { useGetProceduresQuery } from '../../api/procedure/procedureApi';
import { useGetAllUsersQuery } from '../../api/user/userApi';
import { useGetVisitsQuery } from '../../api/visit/visitApi';
import { Loader } from '../../components/Loader/Loader';
import { PaginatedTable } from '../../components/PaginatedTable/PaginatedTable';
import { createPatientsList } from '../../helpers/createPatientsList';
import { useAppDispatch, useAppSelector } from '../../store/hooks';
import {
  patientsTableCurrentSortModelSelector,
  patientsTablePaginationSelector,
  setPatientsTablePagination,
  setPatientsTableSortModel,
} from '../../store/slices/tablesSlice';
import { formatVisitsData } from './helpers';

export const AllVisitsTable = () => {
  const pagination = useAppSelector(patientsTablePaginationSelector);
  const dispatch = useAppDispatch();

  const sort = useAppSelector(patientsTableCurrentSortModelSelector);

  const { data: visits, isFetching: isVisitsLoading } = useGetVisitsQuery({
    page: pagination.page + 1 ?? 1,
    pageSize: pagination.pageSize,
    sort: JSON.stringify(sort),
  });

  const patientIdsArray = createPatientsList(visits?.data);

  const { data: patients, isFetching: isPatientsLoading } = useGetPatientsQuery({ ids: patientIdsArray });

  const { data: procedures } = useGetProceduresQuery();

  const { data: users } = useGetAllUsersQuery();

  const rows = React.useMemo(() => {
    if (visits && users && procedures && patients) {
      return formatVisitsData(visits?.data, users?.data, procedures?.data, patients.data);
    }
  }, [visits, users, procedures, patients]);

  const totalCount = visits?.pagination?.totalCount;

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
    { field: 'visitDate', headerName: 'Время', width: 200 },
    { field: 'patientId', headerName: 'Пациент', width: 150 },
    { field: 'doctorId', headerName: 'Доктор', width: 150 },
    { field: 'authorId', headerName: 'Автор записи', width: 150 },
    { field: 'procedureId', headerName: 'Процедура', width: 150 },
  ];

  console.log(rows);

  if (isVisitsLoading || isPatientsLoading || rows?.some((patient) => !patient.patientId)) {
    return <Loader />;
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
        loading={isVisitsLoading || isPatientsLoading || rows?.some((patient) => !patient.patientId)}
      />
    )
  );
};
