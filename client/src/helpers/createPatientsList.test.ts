import { describe, expect, test } from 'vitest';

import { createPatientsList } from './createPatientsList';

describe('createPatientsList function', () => {
  test('should return an empty array when visits array is undefined', () => {
    const visits = undefined;
    expect(createPatientsList(visits)).toEqual([]);
  });

  test('should return an array of unique patient IDs from visits', () => {
    const visits = [
      {
        id: 1,
        patientId: 101,
        visitDate: '2023-12-31',
        doctorId: 201,
        procedure: 'Checkup',
        authorId: 301,
        isRemindRequired: false,
        extraProcedures: null,
        isPaid: true,
        paymentMethodId: null,
        sum: 54000,
        payments: [],
      },
      {
        id: 2,
        patientId: 102,
        visitDate: '2023-12-30',
        doctorId: 202,
        procedure: 'Surgery',
        authorId: 302,
        isRemindRequired: true,
        extraProcedures: null,
        isPaid: false,
        paymentMethodId: 401,
        sum: 54000,
        payments: [],
      },
      {
        id: 3,
        patientId: 101,
        visitDate: '2023-12-28',
        doctorId: 203,
        procedure: 'X-ray',
        authorId: 303,
        isRemindRequired: true,
        extraProcedures: null,
        isPaid: true,
        paymentMethodId: 402,
        sum: 54000,
        payments: [],
      },
    ];
    const expectedPatientList = [101, 102];

    expect(createPatientsList(visits)).toEqual(expectedPatientList);
  });

  test('should handle an empty visits array', () => {
    const visits: [] = [];
    expect(createPatientsList(visits)).toEqual([]);
  });
});
