import { Pagination } from '../../types';

export interface Patient {
  id: number;
  name: string;
  surname: string;
  phone: string;
}

export interface PatientDto {
  data: Patient[];
  pagination: Pagination;
}

export type PatientPayload = Omit<Patient, 'id'>;
