import * as React from "react";

import { useCreateVisitMutation } from "../../api/visit/visitApi";
import { VisitForm } from "../../components/VisitForm/VisitForm";

export const NewVisit = () => {
  const [mutate, { isSuccess: createVisitSuccess, reset }] =
    useCreateVisitMutation();

  React.useEffect(() => {
    if (createVisitSuccess) {
      reset();
    }
  }, [createVisitSuccess]);

  return <VisitForm mutate={mutate} />;
};
