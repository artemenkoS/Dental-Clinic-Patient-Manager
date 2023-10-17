export interface Auth {
  login: string;
  password: string;
}

export interface AuthResponse {
  message: string;
  token: string;
  data: {
    name: string;
    surname: string;
    role: number;
  };
}
