import dayjs from 'dayjs';
import ru from 'dayjs/locale/ru';
import tz from 'dayjs/plugin/timezone';
import utc from 'dayjs/plugin/utc';

import { useGetUserQuery } from './api/user/userApi';
import { Layout } from './components/Layout/Layout';
import { Loader } from './components/Loader/Loader';
import { useAppSelector } from './store/hooks';
import { userSelector } from './store/slices/authSlice';

const userTimeZone = Intl.DateTimeFormat().resolvedOptions().timeZone;

function App() {
  dayjs.extend(utc);
  dayjs.extend(tz);
  dayjs.locale(ru);
  dayjs.tz.setDefault(userTimeZone);
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
