import * as React from 'react';

import { VisitMutationBody } from '../../api/visit/types';
import { useCreateVisitMutation } from '../../api/visit/visitApi';
import { useAppSelector } from '../../store/hooks';
import { newVisitModalSelector } from '../../store/slices/modalsSlice';
import { VisitFormValues } from '../VisitForm/types';
import { VisitForm } from '../VisitForm/VisitForm';

interface Props {
  values: Partial<VisitFormValues> | null;
}

export const NewVisit: React.FC<Props> = ({ values }) => {
  const [createVisit, { isSuccess: createVisitSuccess, reset }] = useCreateVisitMutation();
  const isOpen = useAppSelector(newVisitModalSelector).isOpen;

  React.useEffect(() => {
    if (createVisitSuccess) {
      reset();
    }
  }, [createVisitSuccess]);

  const handleSubmit = (body: VisitMutationBody) => {
    createVisit({ body });
  };

  return <VisitForm onSubmit={handleSubmit} status="create" values={values} isOpen={isOpen} />;
};
