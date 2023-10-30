import { Pagination } from '../../types';

export interface Patient {
  id: number;
  name: string;
  surname: string;
  phone: string;
}

export interface PatientsDto {
  data: Patient[];
  pagination: Pagination;
}

export interface PatientDto {
  data: Patient;
}

export interface PatientParams {
  page?: number;
  pageSize?: number;
  name?: string;
  surname?: string;
  sort?: string;
  ids?: number[];
}

export type PatientPayload = Omit<Patient, 'id'>;
