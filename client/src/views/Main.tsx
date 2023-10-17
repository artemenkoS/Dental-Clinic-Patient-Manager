import { DeleteVisitModal } from '../components/DeleteVisitModal/DeleteVisitModal';
import { NewVisit } from '../features/NewVisit/NewVisit';
import { VisitsToday } from '../features/VisitsToday/VisitsToday';

export const MainScreen = () => {
  return (
    <>
      <VisitsToday />
      <NewVisit />
      <DeleteVisitModal />
    </>
  );
};
