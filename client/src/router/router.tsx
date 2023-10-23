import { createBrowserRouter } from 'react-router-dom';

import App from '../App';
import { IsAuth } from '../components/Layout/IsAuthed';
import { AuthForm } from '../features/AuthForm/AuthForm';
import { MainScreen } from '../pages/Main';
import { Patients } from '../pages/Patients';

export const router = createBrowserRouter([
  {
    path: '/',
    element: <IsAuth />,
    children: [
      {
        path: '/',
        element: <App />,
        children: [
          {
            path: '/',
            element: <MainScreen />,
          },
          {
            path: '/patients',
            element: <Patients />,
          },
        ],
      },
    ],
  },
  {
    path: '/login',
    element: <AuthForm />,
  },
]);
