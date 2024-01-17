import { GridPaginationModel, GridSortModel } from '@mui/x-data-grid';
import React from 'react';

import { useGetPatientsQuery } from '../../api/patient/patientApi';
import { useGetAllUsersQuery } from '../../api/user/userApi';
import { useGetVisitsQuery } from '../../api/visit/visitApi';
import { Loader } from '../../components/Loader/Loader';
import { PaginatedTable } from '../../components/PaginatedTable/PaginatedTable';
import { createPatientsList } from '../../helpers/createPatientsList';
import { useAppDispatch, useAppSelector } from '../../store/hooks';
import {
  setVisitsTablePagination,
  setVisitsTableSortModel,
  visitsTableCurrentSortModelSelector,
  visitsTablePaginationSelector,
} from '../../store/slices/tablesSlice';
import { VISIT_COLUMNS } from './const';
import { formatVisitsData } from './helpers';

export const AllVisitsTable = () => {
  const dispatch = useAppDispatch();

  const pagination = useAppSelector(visitsTablePaginationSelector);
  const sort = useAppSelector(visitsTableCurrentSortModelSelector);

  const { data: visits, isFetching: isVisitsLoading } = useGetVisitsQuery({
    page: pagination.page + 1 ?? 1,
    pageSize: pagination.pageSize,
    sort: JSON.stringify(sort),
  });

  const patientIdsArray = createPatientsList(visits?.data);

  const { data: patients, isFetching: isPatientsLoading } = useGetPatientsQuery(
    { ids: patientIdsArray },
    { skip: !patientIdsArray.length }
  );

  const { data: users } = useGetAllUsersQuery();

  const rows = React.useMemo(() => {
    if (visits && users && patients) {
      return formatVisitsData(visits?.data, users?.data, patients.data);
    }
  }, [visits, users, patients]);

  const totalCount = visits?.pagination?.totalCount;

  const paginationModel = {
    page: pagination.page,
    pageSize: pagination?.pageSize,
  };

  const onPaginationModelChange = (e: GridPaginationModel) => {
    dispatch(setVisitsTablePagination(e));
  };

  const onSortModelChange = (e: GridSortModel) => {
    dispatch(setVisitsTableSortModel(e));
  };

  if (isVisitsLoading || isPatientsLoading || rows?.some((patient) => !patient.patientId)) {
    return <Loader />;
  }

  return (
    rows &&
    pagination && (
      <PaginatedTable
        columns={VISIT_COLUMNS}
        paginationModel={paginationModel}
        rowCount={totalCount ?? 10}
        rows={rows}
        onPaginationModelChange={onPaginationModelChange}
        onSortModelChange={onSortModelChange}
      />
    )
  );
};
