import { Request, Response } from "express";

import db from "../db";

export const createLogRecord = async (req: Request, res: Response) => {
  const { authorId, doctorId, changes, visitDate, status } = req.body;

  if (!authorId || !doctorId || !visitDate || !status) {
    res.status(400).json("Не все обязательные поля заполнены");
    return;
  }

  try {
    const newLogRecord = await db.query(
      `INSERT INTO history ("authorId", "doctorId", "visitDate", "changes", "status") values ($1, $2, $3, $4, $5) RETURNING *`,
      [authorId, doctorId, visitDate, changes, status]
    );

    res.status(201).json({
      log: newLogRecord.rows[0],
    });
  } catch (error) {
    console.error("Ошибка при записи в историю:", error);
    res.status(500).json("Произошла ошибка при записи в историю");
  }
};

export const getHistory = async (req: Request, res: Response) => {
  try {
    const page = req.query.page ? +req.query.page : 1;
    const pageSize = req.query.pageSize ? +req.query.pageSize : 10;
    const offset = (page - 1) * pageSize;

    let query = `SELECT * FROM history`;

    const result = await db.query(query, [pageSize, offset]);

    const totalCountQuery = await db.query(`SELECT COUNT(*) FROM history`);
    const totalCount = +totalCountQuery.rows[0].count;
    const totalPages = Math.ceil(totalCount / pageSize);

    res.status(200).json({
      data: result.rows,
      pagination: {
        currentPage: page,
        pageSize: pageSize,
        totalPages,
      },
    });
  } catch (error) {
    console.error("Произошла ошибка при получении истории изменений", error);
    res
      .status(500)
      .json({ message: "Произошла ошибка при получении истории изменений" });
  }
};
