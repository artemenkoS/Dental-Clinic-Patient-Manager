import ArrowLeftIcon from '@mui/icons-material/ArrowLeft';
import ArrowRightIcon from '@mui/icons-material/ArrowRight';
import { IconButton, Typography } from '@mui/material';
import { ru } from 'date-fns/locale';
import dayjs from 'dayjs';
import { DayPicker } from 'react-day-picker';

import { useAppDispatch, useAppSelector } from '../../store/hooks';
import { visitDateSelector } from '../../store/slices/visitSlice';
import { setVisitDate } from '../../store/slices/visitSlice';
import { Wrapper } from './styled';

{
  /* <DayPicker mode="single" locale={ru} selected={value} onDayClick={onChange} />; */
}

export const DaySelect = () => {
  const isoDate = useAppSelector(visitDateSelector);
  const dispatch = useAppDispatch();

  const increaseDate = () => {
    const date = new Date(isoDate);
    date.setDate(date.getDate() + 1);
    dispatch(setVisitDate(date.toISOString()));
  };

  const decreaseDate = () => {
    const date = new Date(isoDate);
    date.setDate(date.getDate() - 1);
    dispatch(setVisitDate(date.toISOString()));
  };

  return (
    <Wrapper>
      <div>
        <IconButton onClick={decreaseDate}>
          <ArrowLeftIcon />
        </IconButton>
        <IconButton onClick={increaseDate}>
          <ArrowRightIcon />
        </IconButton>
      </div>
      <Typography>{dayjs(isoDate).format('DD MMMM')}</Typography>
    </Wrapper>
  );
};
