import 'react-day-picker/dist/style.css';

import { DatePickerProps } from '@mui/x-date-pickers';
import dayjs, { Dayjs } from 'dayjs';
import React from 'react';

import { Calendar } from '../Calendar/Calendar';
import { TimeSlots } from '../TimeSlots/TimeSlots';
import { Wrapper } from './styled';

interface Props {
  value?: Date;
  onChange: DatePickerProps<Dayjs>['onChange'];
}

export const DatePicker: React.FC<Props> = ({ value, onChange }) => {
  return (
    <Wrapper>
      <Calendar value={dayjs(value)} onChange={onChange} />
      <TimeSlots />
    </Wrapper>
  );
};
