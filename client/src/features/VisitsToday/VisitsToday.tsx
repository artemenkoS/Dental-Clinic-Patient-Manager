import EditIcon from '@mui/icons-material/Edit';
import { CircularProgress, IconButton, Pagination, Typography } from '@mui/material';
import format from 'date-fns/format';
import { ru } from 'date-fns/locale';
import React from 'react';
import toast from 'react-hot-toast';

import { useGetDoctorsQuery } from '../../api/doctor/doctorApi';
import { useGetVisitsQuery } from '../../api/visit/visitApi';
import { DeleteVisitButton } from '../../components/DeleteVisitModal/DeleteVisitButton';
import { getTodayDate } from '../../helpers/getTodayDate';
import { List, Slot, Wrapper } from './styled';

export const VisitsToday = () => {
  const todayDate = getTodayDate();

  const [page, setPage] = React.useState<number>();

  const { data: visits, isLoading, isSuccess, isError } = useGetVisitsQuery({ startDate: todayDate, page: page });
  const { data: doctors } = useGetDoctorsQuery();

  const handlePaginationChange = (_: React.ChangeEvent<unknown>, value: number) => {
    setPage(value);
  };

  if (isLoading) {
    return <CircularProgress />;
  }

  if (isError) {
    toast('Не удалось загрузить список записей.');
  }

  return (
    <Wrapper>
      <List>
        {isSuccess &&
          visits?.data.map((visit) => {
            const visitDate = new Date(visit.visitDate);
            const formattedDate = format(visitDate, 'd MMMM HH:mm', { locale: ru });
            const doctor = doctors?.data.find((el) => el.id === visit.doctorId);
            return (
              <Slot key={visit.id}>
                <Typography>
                  {formattedDate} Доктор {doctor?.surname}
                </Typography>
                <DeleteVisitButton id={visit.id} />
                <IconButton>
                  <EditIcon />
                </IconButton>
              </Slot>
            );
          })}
      </List>
      <Pagination count={visits?.pagination.totalPages} variant="outlined" onChange={handlePaginationChange} />
    </Wrapper>
  );
};
