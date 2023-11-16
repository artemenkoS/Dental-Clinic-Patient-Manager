import debounce from 'lodash.debounce';
import React from 'react';

import { SearchTextfield } from '../../components/SearchTextField/SearchTextField';
import { useAppDispatch } from '../../store/hooks';
import { setPatientsTableSearch } from '../../store/slices/tablesSlice';

export const PatientSearch = () => {
  const dispatch = useAppDispatch();

  const handleSearchValueChange: React.ChangeEventHandler<HTMLInputElement | HTMLTextAreaElement> = debounce((e) => {
    dispatch(setPatientsTableSearch(e.target.value.replace(/\s/g, '')));
  }, 300);

  return <SearchTextfield onChange={handleSearchValueChange} />;
};
