import { DatePicker, DatePickerProps } from '@mui/x-date-pickers';
import { Dayjs } from 'dayjs';

export const Calendar: React.FC<DatePickerProps<Dayjs>> = ({ value, onChange }) => {
  console.log(onChange);
  return <DatePicker value={value} onChange={onChange} views={['day', 'month']} format="DD MMMM" />;
};
