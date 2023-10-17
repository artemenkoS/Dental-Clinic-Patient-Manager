import { GlobalStyles } from '@mui/material';
import { ThemeProvider } from '@mui/material/styles';
import React from 'react';
import ReactDOM from 'react-dom/client';
import { Toaster } from 'react-hot-toast';
import { Provider } from 'react-redux';
import { RouterProvider } from 'react-router-dom';

import { router } from './router/router.tsx';
import { store } from './store/store.ts';
import { globalStyle } from './styles/global.ts';
import { theme } from './styles/theme.ts';

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <ThemeProvider theme={theme}>
      <Provider store={store}>
        <RouterProvider router={router} />
        <Toaster
          toastOptions={{
            duration: 2200,
          }}
          position="top-right"
          gutter={10}
        />
      </Provider>
    </ThemeProvider>
    <GlobalStyles styles={globalStyle} />
  </React.StrictMode>
);
