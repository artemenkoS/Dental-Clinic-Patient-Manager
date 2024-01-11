import { describe, expect, test } from 'vitest';

import { parseDate } from './parseDate';

describe('parseDate function', () => {
  test('should parse valid date and time correctly', () => {
    const dateTimeString = '2023-12-31T18:30:00';
    const expectedResult = {
      date: '2023-12-31',
      time: '18:30',
    };

    expect(parseDate(dateTimeString)).toEqual(expectedResult);
  });

  test('should return undefined for an invalid date', () => {
    const dateTimeString = 'Invalid Date';
    expect(parseDate(dateTimeString)).toBeUndefined();
  });

  test('should handle empty string input', () => {
    const dateTimeString = '';
    expect(parseDate(dateTimeString)).toBeUndefined();
  });
});
