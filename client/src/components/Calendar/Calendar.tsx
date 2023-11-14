import 'react-day-picker/dist/style.css';

import ru from 'date-fns/locale/ru';
import { DayPicker } from 'react-day-picker';

interface Props {
  selected: Date | undefined;
  onDayClick: (e: Date) => void;
}

export const Calendar: React.FC<Props> = ({ selected, onDayClick }) => {
  return <DayPicker mode="single" locale={ru} selected={selected} onDayClick={onDayClick} />;
};
