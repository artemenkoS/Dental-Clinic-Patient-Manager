import { Request, Response } from 'express';
import { prepareSqlQuery } from '../helpers/prepareSqlQuery';
import { CustomWebSocket, wss } from '../../src';

import db from '../db';
const sendDoctorMessage = (doctorId: string, message: string) => {
  wss.clients.forEach((client: CustomWebSocket) => {
    if (+client.userId === +doctorId) {
      client.send(message);
    }
  });
};

export const createVisit = async (req: Request, res: Response) => {
  const { visitDate, doctorId, patientId, procedure, authorId, isRemindRequired } = req.body;

  if (!visitDate || !doctorId || !patientId) {
    res.status(400).json({ message: 'Не все обязательные поля заполнены' });
    return;
  }

  try {
    const doctorRole = await db.query(`SELECT * FROM role WHERE role = 'doctor'`);

    const user = await db.query(`SELECT * FROM users WHERE id = $1 `, [doctorId]);

    if (user.rows[0].role !== doctorRole.rows[0].id) {
      return res.status(400).json({ message: 'Нельзя записать к этому пользователю' });
    }

    const newVisit = await db.query(
      `INSERT INTO visit ("visitDate", "doctorId", "patientId", "procedure", "authorId", "isRemindRequired") values ($1, $2, $3, $4, $5, $6) RETURNING *`,
      [visitDate, doctorId, patientId, procedure, authorId, isRemindRequired]
    );
    authorId !== doctorId && sendDoctorMessage(doctorId, JSON.stringify({ type: 'newVisit', visitDate }));
    res.status(201).json({
      patient: newVisit.rows[0],
      message: 'Запись успешно создана.',
    });
  } catch (error) {
    console.error('Ошибка при создании записи:', error);
    res.status(500).json({ message: 'Произошла ошибка при создании записи' });
  }
};

export const getVisits = async (req: Request, res: Response) => {
  const { query, queryParams, totalCountQuery, totalCountQueryParams } = prepareSqlQuery(req.query);

  try {
    const visits = await db.query(query, queryParams);

    const page = req.query.page ? +req.query.page : 1;
    const pageSize = req.query.pageSize ? +req.query.pageSize : 50;

    const totalCount = await db.query(totalCountQuery, totalCountQueryParams);

    const totalPages = Math.ceil(+totalCount.rows[0].count / +pageSize);

    if (req.query.page) {
    }

    if (visits.rowCount === 0) {
      res.status(200).json({ message: 'Записи не найдены' });
    } else {
      res.status(200).json({
        data: visits.rows,
        pagination: {
          currentPage: page,
          pageSize: pageSize,
          totalPages,
          totalCount: +totalCount.rows[0].count,
        },
      });
    }
  } catch (error) {
    console.error('Произошла ошибка при выполнении запроса:', error);
    res.status(500).json({ message: 'Произошла ошибка при получении списка записей' });
  }
};

export const getOneVisit = async (req: Request, res: Response) => {
  try {
    const id = req.params.id;
    const visit = await db.query(`SELECT * FROM visit where id = $1`, [id]);
    if (!visit.rows[0]) {
      res.status(404).json({ message: 'Запись не найдена.' });
    } else {
      res.status(200).json(visit.rows[0]);
    }
  } catch (error) {
    console.error('Что-то пошло не так');
    res.status(500).json('Произошла ошибка при получении записи.');
  }
};

export const updateVisit = async (req: Request, res: Response) => {
  const { visitDate, doctorId, patientId, procedure, authorId, isRemindRequired } = req.body;
  const id = req.params.id;

  if (!visitDate || !doctorId || !patientId || !authorId) {
    return res.status(400).json({ message: 'Не все обязательные поля заполнены' });
  }

  try {
    const doctorRole = await db.query(`SELECT * FROM role WHERE role = 'doctor'`);

    const user = await db.query(`SELECT * FROM users WHERE id = $1 `, [doctorId]);

    if (user.rows[0].role !== doctorRole.rows[0].id) {
      return res.status(400).json({ message: 'Нельзя записать к этому пользователю' });
    }

    const updatedVisit = await db.query(
      `UPDATE visit 
       SET "visitDate" = $1, "doctorId" = $2, "patientId" = $3, "procedure" = $4, "authorId" = $5, "isRemindRequired" = $6
       WHERE id = $7
       RETURNING *`,
      [visitDate, doctorId, patientId, procedure, authorId, isRemindRequired, id]
    );

    if (updatedVisit.rows[0]) {
      res.status(200).json({
        visit: updatedVisit.rows[0],
        message: 'Запись успешно обновлена.',
      });
    } else {
      res.status(404).json({ message: 'Запись не найдена.' });
    }
  } catch (error) {
    console.error('Ошибка при обновлении записи:', error);
    res.status(500).json({ message: 'Произошла ошибка при обновлении записи' });
  }
};

export const deleteVisit = async (req: Request, res: Response) => {
  try {
    const id = req.params.id;
    console.log(req.body);
    const visitInfo = await db.query(`SELECT "doctorId", "visitDate", "authorId" FROM visit WHERE id = $1`, [id]);

    const doctorId = visitInfo.rows[0].doctorId;
    const visitDate = visitInfo.rows[0].visitDate;
    const authorId = visitInfo.rows[0].authorId;

    const visit = await db.query(`DELETE FROM visit where id = $1`, [id]);
    if (visit.rowCount === 0) {
      res.status(404).json({ message: 'Запись не найдена.' });
    } else {
      console.log(id, doctorId) + doctorId !== +id &&
        sendDoctorMessage(doctorId, JSON.stringify({ type: 'cancelledVisit', visitDate }));
      res.status(200).json({ message: 'Запись успешно удалена' });
    }
  } catch (error) {
    console.error('Что-то пошло не так');
    res.status(500).json('Произошла ошибка при получении записи');
  }
};
