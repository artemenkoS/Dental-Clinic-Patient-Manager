import { describe, expect, test } from 'vitest';

import { Role } from '../api/role/types';
import { getDoctorRole } from './getDoctorRole';

describe('getDoctorRole function', () => {
  test('should return doctor role when it exists in the roles array', () => {
    const roles: Role[] = [
      { id: 1, role: 'patient' },
      { id: 2, role: 'doctor' },
      { id: 3, role: 'nurse' },
    ];
    const expectedDoctorRole = { id: 2, role: 'doctor' };

    expect(getDoctorRole(roles)).toEqual(expectedDoctorRole);
  });

  test('should return undefined when roles array is empty', () => {
    const roles = [];
    expect(getDoctorRole(roles)).toBeUndefined();
  });

  test('should return undefined when doctor role does not exist in roles array', () => {
    const roles = [
      { id: 1, role: 'patient' },
      { id: 3, role: 'nurse' },
    ];
    expect(getDoctorRole(roles)).toBeUndefined();
  });

  test('should return undefined when roles array is undefined', () => {
    const roles = undefined;
    expect(getDoctorRole(roles)).toBeUndefined();
  });
});
