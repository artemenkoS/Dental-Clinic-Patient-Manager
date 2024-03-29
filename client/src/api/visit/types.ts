import { Pagination } from '../../types';
import { Payment } from '../payment/types';

export interface Procedure {
  label: string;
  sum: number;
}

export interface Visit {
  id: number;
  visitDate: string;
  doctorId: number;
  patientId: number;
  procedure: string;
  authorId: number;
  isRemindRequired: boolean;
  extraProcedures: Procedure[] | null;
  isPaid: boolean;
  paymentMethodId: number | null;
  sum: number;
  payments: Payment[] | null;
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
  extraProcedures: Procedure[] | null;
  isPaid: boolean;
  paymentMethodId: number | null;
  sum?: number;
}
