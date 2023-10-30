import 'react-day-picker/dist/style.css';

import ru from 'date-fns/locale/ru';
import React from 'react';
import { DayClickEventHandler, DayPicker } from 'react-day-picker';

import { TimeSlots } from '../TimeSlots/TimeSlots';
import { Wrapper } from './styled';

interface Props {
  value?: Date;
  onChange: DayClickEventHandler;
}

export const DatePicker: React.FC<Props> = ({ value, onChange }) => {
  console.log(value);
  return (
    <Wrapper>
      <DayPicker mode="single" locale={ru} selected={value} onDayClick={onChange} />
      <TimeSlots />
    </Wrapper>
  );
};
