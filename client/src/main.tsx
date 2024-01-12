import 'react-toastify/dist/ReactToastify.css';

import { GlobalStyles } from '@mui/material';
import { ThemeProvider } from '@mui/material/styles';
import { LocalizationProvider } from '@mui/x-date-pickers';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
import dayjs from 'dayjs';
import ru from 'dayjs/locale/ru';
import tz from 'dayjs/plugin/timezone';
import utc from 'dayjs/plugin/utc';
import ReactDOM from 'react-dom/client';
import { Provider } from 'react-redux';
import { RouterProvider } from 'react-router-dom';
import { ToastContainer } from 'react-toastify';

import { router } from './router/router.tsx';
import { store } from './store/store.ts';
import { globalStyle } from './styles/global.ts';
import { theme } from './styles/theme.ts';

const userTimeZone = Intl.DateTimeFormat().resolvedOptions().timeZone;

dayjs.extend(utc);
dayjs.extend(tz);
dayjs.locale(ru);
dayjs.tz.setDefault(userTimeZone);

ReactDOM.createRoot(document.getElementById('root')!).render(
  <>
    <ThemeProvider theme={theme}>
      <LocalizationProvider dateAdapter={AdapterDayjs} adapterLocale={dayjs.locale()}>
        <Provider store={store}>
          <RouterProvider router={router} />
          <ToastContainer autoClose={1000} />
        </Provider>
      </LocalizationProvider>
    </ThemeProvider>
    <GlobalStyles styles={globalStyle} />
  </>
);
