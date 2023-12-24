import { Request, Response } from 'express';

import db from '../db';

export const getPaymentMethods = async (req: Request, res: Response) => {
  try {
    const result = await db.query(`SELECT * FROM payment_methods`);

    res.status(200).json({
      data: result.rows,
    });
  } catch (error) {
    console.error('Произошла ошибка при получении способов оплаты', error);
    res.status(500).json({ message: 'Произошла ошибка при получении способов оплаты' });
  }
};
