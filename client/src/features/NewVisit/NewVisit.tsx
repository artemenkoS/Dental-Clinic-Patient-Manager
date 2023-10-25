import * as React from 'react';

import { VisitMutationBody } from '../../api/visit/types';
import { useCreateVisitMutation } from '../../api/visit/visitApi';
import { VisitForm } from '../../components/VisitForm/VisitForm';

export const NewVisit = () => {
  const [createVisit, { isSuccess: createVisitSuccess, reset }] = useCreateVisitMutation();

  React.useEffect(() => {
    if (createVisitSuccess) {
      reset();
    }
  }, [createVisitSuccess]);

  const mutate = (body: VisitMutationBody) => {
    createVisit({ body });
  };

  return <VisitForm mutate={mutate} />;
};
