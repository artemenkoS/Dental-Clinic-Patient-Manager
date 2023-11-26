// eslint-disable-next-line simple-import-sort/imports
import { NotificationImportant, NotificationsRounded } from '@mui/icons-material';
import { IconButton, Popover } from '@mui/material';
import React from 'react';

import { useGetNotificationsQuery, useMarkAsReadMutation } from '../../api/notification/notificationApi';
import { useAppSelector } from '../../store/hooks';
import { userSelector } from '../../store/slices/authSlice';
import { theme } from '../../styles/theme';
import { List } from './styled';
import { prepareNotificationText } from '../../components/Layout/helpers';
import dayjs from 'dayjs';

export const NotificationList = () => {
  const user = useAppSelector(userSelector);
  const { data: notifications } = useGetNotificationsQuery({ id: user?.id || 0 }, { skip: !user });
  const [markAsRead] = useMarkAsReadMutation();

  const [anchorEl, setAnchorEl] = React.useState<HTMLButtonElement | null>(null);

  const handleClick = (event: React.MouseEvent<HTMLButtonElement>) => {
    setAnchorEl(event.currentTarget);
    const ids = notifications?.data.map((item) => item.id);
    console.log(ids);
    ids?.length && markAsRead({ body: { ids: ids } });
  };

  const handleClose = () => {
    setAnchorEl(null);
  };

  const open = Boolean(anchorEl);
  const id = open ? 'notificationList' : undefined;
  console.log(notifications);

  const unviewedNotifications = React.useMemo(
    () => notifications?.data.filter((item) => item.isViewed === false),
    [notifications]
  );

  return (
    <>
      <IconButton onClick={handleClick}>
        {unviewedNotifications?.length ? (
          <NotificationImportant sx={{ fill: theme.palette.error.light }} />
        ) : (
          <NotificationsRounded />
        )}
      </IconButton>

      <Popover
        id={id}
        open={open}
        anchorEl={anchorEl}
        onClose={handleClose}
        anchorOrigin={{
          vertical: 'bottom',
          horizontal: 'left',
        }}
      >
        <List>
          {notifications?.data.length
            ? notifications.data.map((item) => (
                <ul>
                  <span>{dayjs(item.createdAt).format(' DD MMM  HH:mm')}</span>
                  {prepareNotificationText(JSON.stringify(item))}
                </ul>
              ))
            : 'Нет уведомлений'}
        </List>
      </Popover>
    </>
  );
};
