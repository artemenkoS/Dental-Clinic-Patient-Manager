import { Request, Response } from "express";
import { prepareSqlQuery } from "../helpers/prepareSqlQuery";

import db from "../db";

export const createVisit = async (req: Request, res: Response) => {
  const { visitDate, doctorId, patientId, procedureId, authorId } = req.body;

  if (!visitDate || !doctorId || !patientId || !procedureId) {
    res.status(400).json({ message: "Не все обязательные поля заполнены" });
    return;
  }

  try {
    const doctorRole = await db.query(
      `SELECT * FROM role WHERE role = 'doctor'`
    );

    const user = await db.query(`SELECT * FROM users WHERE id = $1 `, [
      doctorId,
    ]);

    if (user.rows[0].role !== doctorRole.rows[0].id) {
      return res
        .status(400)
        .json({ message: "Нельзя записать к этому пользователю" });
    }

    const newVisit = await db.query(
      `INSERT INTO visit ("visitDate", "doctorId", "patientId", "procedureId", "authorId") values ($1, $2, $3, $4, $5) RETURNING *`,
      [visitDate, doctorId, patientId, procedureId, authorId]
    );

    res.status(201).json({
      patient: newVisit.rows[0],
      message: "Запись успешно создана.",
    });
  } catch (error) {
    console.error("Ошибка при создании записи:", error);
    res.status(500).json({ message: "Произошла ошибка при создании записи" });
  }
};

export const getVisits = async (req: Request, res: Response) => {
  const { query, queryParams, totalCountQuery, totalCountQueryParams } =
    prepareSqlQuery(req.query);

  try {
    const visits = await db.query(query, queryParams);

    const page = req.query.page ? +req.query.page : 1;
    const pageSize = req.query.pageSize ? +req.query.pageSize : 10;
    console.log(totalCountQuery, "TOTALCOUNTQUERY,", queryParams);

    const totalCount = await db.query(totalCountQuery, totalCountQueryParams);

    const totalPages = Math.ceil(+totalCount.rows[0].count / +pageSize);

    if (req.query.page) {
    }

    if (visits.rowCount === 0) {
      res.status(404).json({ message: "Записи не найдены" });
    } else {
      res.status(200).json({
        data: visits.rows,
        pagination: { currentPage: page, totalPages, pageSize },
      });
    }
  } catch (error) {
    console.error("Произошла ошибка при выполнении запроса:", error);
    res
      .status(500)
      .json({ message: "Произошла ошибка при получении списка записей" });
  }
};

export const getOneVisit = async (req: Request, res: Response) => {
  try {
    const id = req.params.id;
    const visit = await db.query(`SELECT * FROM visit where id = $1`, [id]);
    if (!visit.rows[0]) {
      res.status(404).json({ message: "Запись не найдена." });
    } else {
      res.status(200).json(visit.rows[0]);
    }
  } catch (error) {
    console.error("Что-то пошло не так");
    res.status(500).json("Произошла ошибка при получении записи.");
  }
};

export const updateVisit = async (req: Request, res: Response) => {
  const { date, doctor, patient, id } = req.body;

  try {
    const updatedVisit = await db.query(
      `UPDATE visit set visitDate =  $1, doctorId = $2, patient= $3 where id = $4 RETURNING *`,
      [date, doctor, patient, id]
    );

    res.status(201).json({
      patient: updatedVisit.rows[0],
      message: "Запись успешно изменена.",
    });
  } catch (error) {
    console.error("Ошибка при изменении записи", error);
    res.status(500).json({ message: "Произошла ошибка при создании записи." });
  }
};

export const deleteVisit = async (req: Request, res: Response) => {
  try {
    const id = req.params.id;
    const visit = await db.query(`DELETE FROM visit where id = $1`, [id]);
    if (visit.rowCount === 0) {
      res.status(404).json({ message: "Запись не найдена." });
    } else {
      res.status(200).json({ message: "Запись успешно удалена" });
    }
  } catch (error) {
    console.error("Что-то пошло не так");
    res.status(500).json("Произошла ошибка при получении записи");
  }
};
