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

export interface PatientParams {
  page?: number;
  pageSize?: number;
  name?: string;
  surname?: string;
  sort?: string;
}

export type PatientPayload = Omit<Patient, 'id'>;
