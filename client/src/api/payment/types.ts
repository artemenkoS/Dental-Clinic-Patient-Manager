export interface PaymentMethod {
  id: number;
  label: string;
}

export interface Payment {
  id: number;
  visitId: number;
  amount: number;
  paymentMethodId: number;
}

export interface PaymentParams {
  visitId: string;
}

export type PaymentPayload = Omit<Payment, 'id'>;
