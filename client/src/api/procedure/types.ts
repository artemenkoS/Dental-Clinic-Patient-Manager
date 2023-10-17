import { Pagination } from '../../types';

export interface Procedure {
  id: number;
  procedure: string;
}

export interface ProcedureDto {
  data: Procedure[];
  pagination: Pagination;
}
