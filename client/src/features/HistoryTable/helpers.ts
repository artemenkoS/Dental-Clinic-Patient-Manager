import dayjs from 'dayjs';

import { LogRecord } from '../../api/history/types';
import { User } from '../../api/user/types';

const STATUSES = {
  create: 'Cоздание',
  edit: 'Изменение',
  delete: 'Удаление',
};

export const formatHistoryData = (history: LogRecord[], users: User[]) => {
  if (!history || !users) {
    return [];
  }
  return history.map((item) => ({
    id: item.id,
    visitDate: dayjs(item.visitDate).format('DD MMMM HH:mm'),
    doctor: `${users.filter((user) => user.id === item.doctorId)[0].name} ${
      users.filter((user) => user.id === item.doctorId)[0].surname
    }`,
    author: `${users.filter((user) => user.id === item.authorId)[0].name} ${
      users.filter((user) => user.id === item.authorId)[0].surname
    }`,
    changes: JSON.stringify(item.changes),
    status: STATUSES[item.status],
  }));
};
