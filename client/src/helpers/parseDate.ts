export const parseDate = (dateTimeString: string) => {
  const timestamp = Date.parse(dateTimeString);

  if (isNaN(timestamp)) {
    return;
  }

  const dateTime = new Date(timestamp);

  const date = dateTime.toISOString().split('T')[0];
  const time = dateTime.toISOString().split('T')[1].slice(0, 5);

  const result = {
    date: date,
    time: time,
  };

  return result;
};
