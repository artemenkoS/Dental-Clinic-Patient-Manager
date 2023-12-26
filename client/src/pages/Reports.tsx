import { Grid, List, ListItem, Typography } from '@mui/material';
import dayjs from 'dayjs';

import { useGetDoctorsQuery } from '../api/doctor/doctorApi';
import { useGetPaymentMethodsQuery } from '../api/payment/paymentApi';
import { useGetVisitsQuery } from '../api/visit/visitApi';
import { DaySelect } from '../components/DaySelector/DaySelect';
import { useAppSelector } from '../store/hooks';
import { visitDateSelector } from '../store/slices/visitSlice';

export const Reports = () => {
  const date = useAppSelector(visitDateSelector);

  const { data: visits } = useGetVisitsQuery({
    startDate: dayjs(date).format('YYYY-MM-DD'),
    sort: JSON.stringify([{ field: 'visitDate', sort: 'asc' }]),
  });

  const { data: doctors } = useGetDoctorsQuery();
  const { data: paymentMethods } = useGetPaymentMethodsQuery();

  return (
    <Grid container direction="column" spacing={4}>
      <Grid item>
        <DaySelect />
      </Grid>
      <Grid item>
        <Grid container direction="row" gap={5}>
          {visits?.data &&
            doctors?.data.map((doctor) => {
              const filteredVisits = visits?.data?.filter((el) => el.doctorId === doctor.id);
              if (filteredVisits.length > 0) {
                const transformedObject: Record<string, number> = {};
                transformedObject['xray'] = 0;
                paymentMethods?.data.forEach((item) => (transformedObject[item.id] = 0));

                filteredVisits.forEach((visit) => {
                  if (!transformedObject[visit.paymentMethodId?.toString() ?? 0]) {
                    transformedObject[visit.paymentMethodId?.toString() ?? 0] = 0;
                  }

                  visit.extraProcedures?.forEach((procedure) => {
                    if (!procedure.label.toLowerCase().includes('рентген')) {
                      transformedObject[visit.paymentMethodId ?? 0] += +procedure.sum;
                    } else {
                      transformedObject['xray'] += +procedure.sum;
                    }
                  });
                });

                const totalXray = Object.values(transformedObject).reduce(
                  (total, value) => (typeof value === 'number' ? total + value : total),
                  0
                );

                return (
                  <Grid item key={doctor.id} spacing={4}>
                    <Typography variant="body2">
                      {doctor.name} {doctor.surname}
                    </Typography>

                    <List>
                      {paymentMethods?.data?.map((item) => (
                        <ListItem key={item.id}>
                          {item.label} {+transformedObject[item.id] || 0}
                        </ListItem>
                      ))}
                      <ListItem>
                        Рентген {+transformedObject['xray'] || 0} (Итого: {totalXray || 0})
                      </ListItem>
                    </List>
                  </Grid>
                );
              }
              return null;
            })}
        </Grid>
      </Grid>
    </Grid>
  );
};
