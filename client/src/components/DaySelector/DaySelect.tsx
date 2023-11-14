import ArrowLeftIcon from '@mui/icons-material/ArrowLeft';
import ArrowRightIcon from '@mui/icons-material/ArrowRight';
import { Button, IconButton, Popover } from '@mui/material';
import dayjs from 'dayjs';
import React from 'react';

import { useAppDispatch, useAppSelector } from '../../store/hooks';
import { visitDateSelector } from '../../store/slices/visitSlice';
import { setVisitDate } from '../../store/slices/visitSlice';
import { Calendar } from '../Calendar/Calendar';
import { Wrapper } from './styled';

export const DaySelect = () => {
  const [anchorEl, setAnchorEl] = React.useState<HTMLButtonElement | null>(null);

  const handleClick = (event: React.MouseEvent<HTMLButtonElement>) => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = () => {
    setAnchorEl(null);
  };

  const open = Boolean(anchorEl);
  const id = open ? 'calendar' : undefined;

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

  const onDayChange = (e: Date) => {
    dispatch(setVisitDate(e.toISOString()));
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
      <Button aria-describedby={id} onClick={handleClick}>
        {dayjs(isoDate).format('DD MMMM')}
      </Button>
      <Popover
        id={id}
        open={open}
        anchorEl={anchorEl}
        onClose={handleClose}
        anchorOrigin={{
          vertical: 'bottom',
          horizontal: 'left',
        }}
      >
        <Calendar selected={new Date(isoDate)} onDayClick={onDayChange} />
      </Popover>
    </Wrapper>
  );
};
