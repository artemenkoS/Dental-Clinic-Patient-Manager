import dayjs from 'dayjs';
import ru from 'dayjs/locale/ru';
import utc from 'dayjs/plugin/utc';

import { useGetUserQuery } from './api/user/userApi';
import { Layout } from './components/Layout/Layout';
import { Loader } from './components/Loader/Loader';
import { useAppSelector } from './store/hooks';
import { userSelector } from './store/slices/authSlice';

function App() {
  dayjs.extend(utc);
  dayjs.locale(ru);
  useGetUserQuery();
  const user = useAppSelector(userSelector);
  if (!user) {
    return <Loader />;
  }
  return (
    <>
      <Layout />
    </>
  );
}

export default App;
