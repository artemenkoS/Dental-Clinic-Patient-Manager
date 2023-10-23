import { Visit } from '../visit/types';

export interface LogRecord {
  authorId: number;
  doctorId: number;
  visitDate: string;
  changes: Partial<Visit>;
}
