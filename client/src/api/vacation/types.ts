export interface Vacation {
  startDate: string;
  endDate: string;
  doctorId: number;
  id: number;
}

export interface VacationDto {
  data: Vacation[];
}

export type VacationMutationBody = Omit<Vacation, 'id'>;
