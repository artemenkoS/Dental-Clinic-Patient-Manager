import { Pagination } from '../../types';

export interface Visit {
  id: number;
  visitDate: string;
  doctorId: number;
  patientId: number;
  procedureId: number;
  authorId: number;
}

export interface VisitDto {
  data: Visit[];
  pagination: Pagination;
  message?: string;
}

export interface VisitParams {
  startDate?: string;
  endDate?: string;
  page?: number;
  pageSize?: number;
  doctorId?: string;
  patientId?: string;
  procedureId?: string;
}

export interface VisitMutationBody {
  visitDate: string;
  patientId: number;
  doctorId: number;
  procedureId: number;
  authorId: number;
}
