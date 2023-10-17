import { format } from 'date-fns';

import { Visit } from '../api/visit/types';
export const getBusySlots = (visits: Visit[]) => {
  const timeSet = new Set();

  visits.forEach((visit) => {
    const visitDate = new Date(visit.visitDate);
    const formattedTime = format(visitDate, 'HH:mm');
    timeSet.add(formattedTime);
  });

  return timeSet;
};
