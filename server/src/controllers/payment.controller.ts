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

export const getPaymentsByVisit = async (req: Request, res: Response) => {
  const { visitId } = req.params;
  try {
    const result = await db.query(`SELECT * FROM payment where "visitId" = $1`, [visitId]);

    res.status(200).json({
      data: result.rows,
    });
  } catch (error) {
    console.error('Произошла ошибка при получении платежей', error);
    res.status(500).json({ message: 'Произошла ошибка при получении платежей' });
  }
};

export const createPayments = async (req: Request, res: Response) => {
  const payments = req.body;

  if (!Array.isArray(payments) || payments.length === 0) {
    res.status(400).json('Передан неверный формат данных для создания платежей');
    return;
  }

  const createdPayments = [];

  for (const payment of payments) {
    const { visitId, paymentMethodId, amount } = payment;

    if (!visitId || !paymentMethodId || !amount) {
      res.status(400).json('Не все обязательные поля для создания платежа заполнены');
      return;
    }

    try {
      const newPayment = await db.query(
        `INSERT INTO payment ("visitId", "paymentMethodId", amount) VALUES ($1, $2, $3) RETURNING *`,
        [visitId, paymentMethodId, amount]
      );

      createdPayments.push(newPayment.rows[0]);
    } catch (error) {
      console.error('Ошибка при создании платежа:', error);
      res.status(500).json('Произошла ошибка при создании платежа');
      return;
    }
  }

  res.status(201).json({
    payments: createdPayments,
    message: 'Платежи успешно созданы.',
  });
};

export const updatePayment = async (req: Request, res: Response) => {
  const { visitId, paymentMethodId, amount, id } = req.body;

  try {
    const newPatient = await db.query(
      `UPDATE patient set "visitId" =  $1, "paymentMethodId" = $2, amount= $3 where id = $4 RETURNING *`,
      [visitId, paymentMethodId, amount, id]
    );

    res.status(201).json({
      patient: newPatient.rows[0],
      message: 'Платеж обновлён успешно.',
    });
  } catch (error) {
    console.error('Ошибка при обновлении платежа:', error);
    res.status(500).json('Произошла ошибка при обновлении платежа');
  }
};
