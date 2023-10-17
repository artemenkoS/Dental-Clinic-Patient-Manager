import format from 'date-fns/format';

export const getTodayDate = () => {
  const currentDate = new Date();
  const formattedDate = format(currentDate, 'yyyy-MM-dd');

  return formattedDate;
};
