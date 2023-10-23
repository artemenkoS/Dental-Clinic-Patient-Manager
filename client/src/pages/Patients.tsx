import { NewPatienButton } from '../components/NewPatientForm/NewPatienButton';
import { NewPatient } from '../components/NewPatientForm/NewPatientForm';
import { AllPatientsTable } from '../features/AllPatientsTable/AllPatientsTable';
export const Patients = () => {
  return (
    <>
      <AllPatientsTable />
      <NewPatienButton />
      <NewPatient />
    </>
  );
};
