import { Request, Response } from "express";

import db from "../db";

export const createLogRecord = async (req: Request, res: Response) => {
  const { authorId, doctorId, changes, visitDate } = req.body;

  if (!authorId || !doctorId || !visitDate || !changes) {
    res.status(400).json("Не все обязательные поля заполнены");
    return;
  }

  try {
    const newLogRecord = await db.query(
      `INSERT INTO history (authorId, doctorId, visitDate, changes) values ($1, $2, $3, $4) RETURNING *`,
      [authorId, doctorId, visitDate, changes]
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

// export const getOnePatient = async (req: Request, res: Response) => {
//   try {
//     const id = req.params.id;
//     const user = await db.query(`SELECT * FROM patient where id = $1`, [id]);
//     if (!user.rows[0]) {
//       res.status(404).json({ message: "Пользователь не найден." });
//     } else {
//       res.status(200).json({ data: user.rows[0] });
//     }
//   } catch (error) {
//     console.error("Что-то пошло не так");
//     res
//       .status(500)
//       .json("Произошла ошибка при получении информации о пациенте");
//   }
// };

// export const updatePatient = async (req: Request, res: Response) => {
//   const { name, surname, phone, id } = req.body;

//   try {
//     const newPatient = await db.query(
//       `UPDATE patient set name =  $1, surname = $2, phone= $3 where id = $4 RETURNING *`,
//       [name, surname, phone, id]
//     );

//     res.status(201).json({
//       patient: newPatient.rows[0],
//       message: "Данные паицента успешно изменены.",
//     });
//   } catch (error) {
//     console.error("Ошибка при создании пациента:", error);
//     res.status(500).json("Произошла ошибка при создании пациента");
//   }
// };

// export const deletePatient = async (req: Request, res: Response) => {
//   try {
//     const id = req.params.id;
//     const user = await db.query(`DELETE FROM patient where id = $1`, [id]);
//     if (user.rowCount === 0) {
//       res.status(404).json({ message: "Пациент не найден." });
//     } else {
//       res.status(200).json({ message: "Пациент успешно удален" });
//     }
//   } catch (error) {
//     console.error("Что-то пошло не так");
//     res
//       .status(500)
//       .json("Произошла ошибка при получении информации о пациенте");
//   }
// };
