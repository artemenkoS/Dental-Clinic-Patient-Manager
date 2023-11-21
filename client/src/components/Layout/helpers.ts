import dayjs from 'dayjs';

export const prepareNotificationText = (data: string) => {
  const parsedData = JSON.parse(data);
  console.log(parsedData);
  switch (parsedData.type) {
    case 'newVisit':
      return `Новая запись на ${dayjs(parsedData.visitDate).format('HH:mm')}`;
    case 'cancelledVisit':
      return `Запись на ${dayjs(parsedData.visitDate).format('HH:mm')} отменена`;
    default:
      return 'Новое уведомление';
  }
};
