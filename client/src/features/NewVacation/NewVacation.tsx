import * as React from 'react';

import { VacationMutationBody } from '../../api/vacation/types';
import { useCreateVacationMutation } from '../../api/vacation/vacationApi';
import { useAppSelector } from '../../store/hooks';
import { vacationModalSelector } from '../../store/slices/modalsSlice';
import { VacationForm } from '../VacationForm/VacationForm';
import { VisitFormValues } from '../VisitForm/types';

interface Props {
  values: Partial<VisitFormValues> | null;
}

export const NewVacation: React.FC<Props> = () => {
  const [createVacation, { isSuccess: createVacationSuccess, reset }] = useCreateVacationMutation();
  const isOpen = useAppSelector(vacationModalSelector).isOpen;

  React.useEffect(() => {
    if (createVacationSuccess) {
      reset();
    }
  }, [createVacationSuccess]);

  const handleSubmit = (body: VacationMutationBody) => {
    createVacation({ body });
  };

  return <VacationForm onSubmit={handleSubmit} status="create" isOpen={isOpen} />;
};
