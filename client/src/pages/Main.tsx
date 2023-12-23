import { useGetOnePatientQuery } from '../api/patient/patientApi';
import { DeleteVisitModal } from '../features/DeleteVisitModal/DeleteVisitModal';
import { EditVisit } from '../features/EditVisit/EditVisit';
import { NewVisit } from '../features/NewVisit/NewVisit';
import { NewVisitButton } from '../features/NewVisit/NewVisitButton';
import { PatientProfile } from '../features/PatientProfile/PatientProfile';
import { VisitsList } from '../features/VisitsList/VisitsList';
import { useAppSelector } from '../store/hooks';
import { patientProfileModalSelector } from '../store/slices/modalsSlice';

export const MainScreen = () => {
  const state = useAppSelector(patientProfileModalSelector);
  const { data: patient } = useGetOnePatientQuery(state.patientId ?? 0, { skip: !state.patientId });
  console.log(patient);
  return (
    <>
      <VisitsList />
      <NewVisitButton />
      {!patient && <NewVisit values={null} />}
      <EditVisit />
      <DeleteVisitModal />
      <PatientProfile />
    </>
  );
};
