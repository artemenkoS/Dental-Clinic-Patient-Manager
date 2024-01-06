import { Request, Response } from 'express';

import db from '../db';

export const getAllVacations = async (req: Request, res: Response) => {
  try {
    const vacations = await db.query(`SELECT * FROM vacation `);

    if (!vacations.rows) {
      return res.status(404).json({ message: 'Отпуск не найден.' });
    }

    res.status(200).json({ data: vacations.rows });
  } catch (error) {
    console.error('Что-то пошло не так:', error);
    res.status(500).json({ message: 'Произошла ошибка при получении отпусков' });
  }
};

export const getDoctorVacations = async (req: Request, res: Response) => {
  try {
    const id = req.params.id;

    const vacations = await db.query(`SELECT * FROM vacation WHERE "doctorId" = $1`, [id]);

    if (!vacations.rows.length) {
      return res.status(200).json({ message: 'Отпуски для этого доктора не найдены.' });
    }

    res.status(200).json({ data: vacations.rows });
  } catch (error) {
    console.error('Что-то пошло не так:', error);
    res.status(500).json({ message: 'Произошла ошибка при получении отпусков' });
  }
};

export const createVacation = async (req: Request, res: Response) => {
  const { startDate, endDate, doctorId } = req.body;

  if (!startDate || !endDate || !doctorId) {
    res.status(400).json('Не все обязательные поля заполнены');
    return;
  }

  try {
    const vacation = await db.query(
      `INSERT INTO vacation ("startDate", "endDate", "doctorId") values ($1, $2, $3) RETURNING *`,
      [startDate, endDate, doctorId]
    );

    res.status(201).json({
      patient: vacation.rows[0],
      message: 'Отпуск успешно создан.',
    });
  } catch (error) {
    console.error('Ошибка при создании отпуска:', error);
    res.status(500).json('Произошла ошибка при создании отпуска');
  }
};

export const updateVacation = async (req: Request, res: Response) => {
  const { startDate, endDate, doctorId } = req.body;
  const id = req.params.id;

  try {
    const vacation = await db.query(
      `UPDATE vacation set "startDate" =  $1, "endDate" = $2 , "doctorId" = $3 where id = $4 RETURNING *`,
      [startDate, endDate, doctorId, id]
    );

    res.status(201).json({
      data: vacation.rows[0],
      message: 'Отпуск успешно изменен.',
    });
  } catch (error) {
    console.error('Ошибка при изменении отпуска:', error);
    res.status(500).json('Произошла ошибка при изменении отпуска');
  }
};

export const deleteVacation = async (req: Request, res: Response) => {
  try {
    const id = req.params.id;
    const vacation = await db.query(`DELETE FROM vacation where id = $1`, [id]);
    if (vacation.rowCount === 0) {
      res.status(404).json({ message: 'Отпуск не найден.' });
    } else {
      res.status(200).json({ message: 'Отпуск успешно удален' });
    }
  } catch (error) {
    console.error('Что-то пошло не так');
    res.status(500).json('Произошла ошибка при удалении отпуска');
  }
};
