import 'react-day-picker/dist/style.css';

import { format } from 'date-fns';
import { ru } from 'date-fns/locale';
import React from 'react';
import { DayClickEventHandler, DayPicker } from 'react-day-picker';

import { TimeSlots } from '../TimeSlots/TimeSlots';
import { Wrapper } from './styled';

interface Props {
  value?: Date;
  onChange: DayClickEventHandler;
}

export const DatePicker: React.FC<Props> = ({ value, onChange }) => {
  let footer = <p>Выберите дату.</p>;
  if (value) {
    footer = <p>Выбрано {format(value, 'yyyy-MM-dd')}.</p>;
  }
  return (
    <Wrapper>
      <DayPicker locale={ru} mode="single" selected={value} onDayClick={onChange} footer={footer} />
      <TimeSlots />
    </Wrapper>
  );
};
