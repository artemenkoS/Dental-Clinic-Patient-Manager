import { Visit } from "../types";

export interface Patient {
  name: string;
  surname: string;
  visits: Visit[] | null;
}
