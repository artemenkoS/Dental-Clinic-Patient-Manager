import dayjs from 'dayjs';

import { Patient } from '../../api/patient/types';
import { Procedure } from '../../api/procedure/types';
import { User } from '../../api/user/types';
import { Visit } from '../../api/visit/types';

export const formatVisitsData = (visits: Visit[], users: User[], procedures: Procedure[], patients: Patient[]) => {
  if (!visits || !users) {
    return [];
  }
  return visits.map((item) => {
    const patient = patients.find((patient) => patient.id === item.patientId);
    return {
      id: item.id,
      visitDate: dayjs(item.visitDate).format('DD MMMM HH:mm'),
      doctorId: `${users.find((user) => user.id === item.doctorId)?.name} ${users.find(
        (user) => user.id === item.doctorId
      )?.surname}`,
      authorId: `${users.filter((user) => user.id === item.authorId)[0].name} ${
        users.filter((user) => user.id === item.authorId)[0].surname
      }`,
      procedureId: procedures.find((procedure) => procedure.id === item.procedureId)?.procedure,
      patientId: `${patient?.name} ${patient?.surname}`,
    };
  });
};
