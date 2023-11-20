import { Pagination } from '../../types';

export interface Visit {
  id: number;
  visitDate: string;
  doctorId: number;
  patientId: number;
  procedure: number;
  authorId: number;
  isRemindRequired: boolean;
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
  procedure?: string;
  sort?: string;
}

export interface VisitMutationBody {
  visitDate: string;
  patientId: number;
  doctorId: number;
  procedure: string;
  authorId: number;
  isRemindRequired: boolean;
}
