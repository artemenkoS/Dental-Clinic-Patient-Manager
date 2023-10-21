import { DeleteVisitModal } from '../features/DeleteVisitModal/DeleteVisitModal';
import { EditVisit } from '../features/EditVisit/EditVisit';
import { NewVisit } from '../features/NewVisit/NewVisit';
import { NewVisitButton } from '../features/NewVisit/NewVisitButton';
import { VisitsToday } from '../features/VisitsToday/VisitsToday';

export const MainScreen = () => {
  return (
    <>
      <VisitsToday />
      <NewVisitButton />
      <NewVisit />
      <EditVisit />
      <DeleteVisitModal />
    </>
  );
};
