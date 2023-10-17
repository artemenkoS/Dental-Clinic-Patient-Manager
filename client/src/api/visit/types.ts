import { Pagination } from '../../types';

export interface Visit {
  id: number;
  visitDate: string;
  doctorId: number;
  patientId: number;
  procedure: null | number;
}

export interface VisitDto {
  data: Visit[];
  pagination: Pagination;
}

export interface VisitParams {
  startDate?: string;
  endDate?: string;
  page?: number;
  pageSize?: number;
  doctorId?: string;
  patientId?: string;
  procedure?: string;
}

export interface VisitMutationBody {
  visitDate: string;
  patientId: number;
  doctorId: number;
  procedure: number;
  author: number;
}
