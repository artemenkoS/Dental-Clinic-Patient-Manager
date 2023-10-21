import * as React from 'react';

import { useGetFormatedPatientQuery } from '../../api/patient/patientApi';
import { useUpdateVisitMutation } from '../../api/visit/visitApi';
import { VisitForm } from '../../components/VisitForm/VisitForm';
import { parseDate } from '../../helpers/parseDate';
import { useAppDispatch } from '../../store/hooks';
import { useAppSelector } from '../../store/hooks';
import { editVisitModalSelector } from '../../store/slices/modalsSlice';
import { setSelectedSlot } from '../../store/slices/visitSlice';
import { setBusySlots } from '../../store/slices/visitSlice';

export const EditVisit = () => {
  const dispatch = useAppDispatch();

  const handleClose = () => {
    dispatch(setSelectedSlot(null));
    dispatch(setBusySlots(null));
  };
  const visit = useAppSelector(editVisitModalSelector).editableVisit;
  const { data: patient } = useGetFormatedPatientQuery(visit?.patientId?.toString() || '', {
    skip: !visit,
  });
  const date = parseDate(visit?.visitDate ?? '');

  console.log(patient);

  const [mutate, { isSuccess: createVisitSuccess, reset }] = useUpdateVisitMutation();

  React.useEffect(() => {
    if (createVisitSuccess) {
      reset();
      handleClose();
    }
  }, [createVisitSuccess]);

  return (
    visit &&
    patient &&
    date && (
      <VisitForm
        mutate={mutate}
        values={{
          ...visit,
          patient: patient,
          doctorId: visit.doctorId.toString(),
          procedureId: visit.procedureId.toString(),
          authorId: visit.authorId.toString(),
          visitDate: new Date(date?.date),
        }}
      />
    )
  );
};
