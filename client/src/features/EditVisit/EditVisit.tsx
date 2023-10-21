import * as React from "react";

import { useUpdateVisitMutation } from "../../api/visit/visitApi";
import { useAppDispatch } from "../../store/hooks";
import { useGetFormatedPatientQuery } from "../../api/patient/patientApi";
import { setSelectedSlot } from "../../store/slices/visitSlice";
import { setBusySlots } from "../../store/slices/visitSlice";
import { VisitForm } from "../../components/VisitForm/VisitForm";
import { useAppSelector } from "../../store/hooks";
import { editVisitModalSelector } from "../../store/slices/modalsSlice";
import { parseDate } from "../../helpers/parseDate";

export const EditVisit = () => {
  const dispatch = useAppDispatch();

  const handleClose = () => {
    dispatch(setSelectedSlot(null));
    dispatch(setBusySlots(null));
  };
  const visit = useAppSelector(editVisitModalSelector).editableVisit;
  const { data: patient } = useGetFormatedPatientQuery(
    visit?.patientId?.toString() || "",
    {
      skip: !visit,
    }
  );
  const date = parseDate(visit?.visitDate ?? "");

  console.log(patient);

  const [mutate, { isSuccess: createVisitSuccess, reset }] =
    useUpdateVisitMutation();

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
          visitDate: new Date(date?.date),
        }}
      />
    )
  );
};
