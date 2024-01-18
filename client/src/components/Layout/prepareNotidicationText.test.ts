import { describe, expect, test } from 'vitest';

import { prepareNotificationText } from './helpers';
3333;
describe('prepareNotificationText function', () => {
  test('should return correct text for newVisit type', () => {
    const data = '{"type": "newVisit", "visitDate": "2024-01-17T12:00:00"}';
    expect(prepareNotificationText(data)).toBe('Новая запись на 12:00');
  });

  test('should return correct text for editVisit type', () => {
    const data = '{"type": "editVisit", "visitDate": "2024-01-17T15:30:00"}';
    expect(prepareNotificationText(data)).toBe('Изменение в записи на 15:30');
  });

  test('should return correct text for cancelledVisit type', () => {
    const data = '{"type": "cancelledVisit", "visitDate": "2024-01-17T09:45:00"}';
    expect(prepareNotificationText(data)).toBe('Запись на 09:45 отменена');
  });

  test('should return default text for unknown type', () => {
    const data = '{"type": "unknownType"}';
    expect(prepareNotificationText(data)).toBe('Новое уведомление');
  });
});
