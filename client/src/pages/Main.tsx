import { DeleteVisitModal } from '../features/DeleteVisitModal/DeleteVisitModal';
import { EditVisit } from '../features/EditVisit/EditVisit';
import { NewVisit } from '../features/NewVisit/NewVisit';
import { NewVisitButton } from '../features/NewVisit/NewVisitButton';
import { PatientProfile } from '../features/PatientProfile/PatientProfile';
import { VisitsList } from '../features/VisitsList/VisitsList';
import { useAppSelector } from '../store/hooks';
import { editVisitModalSelector, newVisitModalSelector } from '../store/slices/modalsSlice';

export const MainScreen = () => {
  const { isOpen: isEditVisitOpen } = useAppSelector(editVisitModalSelector);
  const { isOpen: isNewVisitOpen } = useAppSelector(newVisitModalSelector);

  return (
    <>
      <VisitsList />
      <NewVisitButton />
      {isNewVisitOpen && <NewVisit values={null} />}
      {isEditVisitOpen && <EditVisit />}
      <DeleteVisitModal />
      <PatientProfile />
    </>
  );
};
