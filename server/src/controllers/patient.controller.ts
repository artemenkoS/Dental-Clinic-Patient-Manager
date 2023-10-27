import { Request, Response } from "express";

import db from "../db";

export const createPatient = async (req: Request, res: Response) => {
  const { name, surname, phone } = req.body;

  if (!name || !surname || !phone) {
    res.status(400).json("Не все обязательные поля заполнены");
    return;
  }

  try {
    const newPatient = await db.query(
      `INSERT INTO patient (name, surname, phone) values ($1, $2, $3) RETURNING *`,
      [name, surname, phone]
    );

    res.status(201).json({
      patient: newPatient.rows[0],
      message: "Пациент успешно создан.",
    });
  } catch (error) {
    console.error("Ошибка при создании пациента:", error);
    res.status(500).json("Произошла ошибка при создании пациента");
  }
};

export const getPatients = async (req: Request, res: Response) => {
  try {
    const page = req.query.page ? +req.query.page : 1;
    const pageSize = req.query.pageSize ? +req.query.pageSize : 10;
    const offset = (page - 1) * pageSize;
    const sort = req.query.sort as string;
    console.log(sort, "SORT", typeof sort);

    if (sort) {
      console.log(JSON.parse(sort), typeof JSON.parse(sort));
    }

    let query = `SELECT * FROM patient`;

    const queryParams = [];

    if (sort?.length) {
      JSON.parse(sort).forEach((item: { field: string; sort: string }) => {
        query += ` ORDER by ${item.field} ${item.sort}`;
      });
      console.log(query);
    }

    if (req.query.search) {
      query += ` WHERE (REPLACE(name, ' ', '') || REPLACE(surname, ' ', '')) ILIKE $1`;
      queryParams.push(`%${req.query.search.toString().replace(/\s/g, "")}%`);
    }

    query += ` LIMIT $${queryParams.length + 1} OFFSET $${
      queryParams.length + 2
    }`;

    const result = await db.query(query, [...queryParams, pageSize, offset]);

    const totalCountQuery = await db.query(
      `SELECT COUNT(*) FROM patient${
        queryParams.length > 0 ? " WHERE name ILIKE $1 OR surname ILIKE $1" : ""
      }`,
      queryParams
    );
    const totalCount = +totalCountQuery.rows[0].count;
    const totalPages = Math.ceil(totalCount / pageSize);

    res.status(200).json({
      data: result.rows,
      pagination: {
        currentPage: page,
        pageSize: pageSize,
        totalPages,
        totalCount,
      },
    });
  } catch (error) {
    console.error("Произошла ошибка при получении списка пациентов:", error);
    res.status(500).json("Произошла ошибка при получении списка пациентов");
  }
};

export const getOnePatient = async (req: Request, res: Response) => {
  try {
    const id = req.params.id;
    const user = await db.query(`SELECT * FROM patient where id = $1`, [id]);
    if (!user.rows[0]) {
      res.status(404).json({ message: "Пользователь не найден." });
    } else {
      res.status(200).json({ data: user.rows[0] });
    }
  } catch (error) {
    console.error("Что-то пошло не так");
    res
      .status(500)
      .json("Произошла ошибка при получении информации о пациенте");
  }
};

export const updatePatient = async (req: Request, res: Response) => {
  const { name, surname, phone, id } = req.body;

  try {
    const newPatient = await db.query(
      `UPDATE patient set name =  $1, surname = $2, phone= $3 where id = $4 RETURNING *`,
      [name, surname, phone, id]
    );

    res.status(201).json({
      patient: newPatient.rows[0],
      message: "Данные паицента успешно изменены.",
    });
  } catch (error) {
    console.error("Ошибка при создании пациента:", error);
    res.status(500).json("Произошла ошибка при создании пациента");
  }
};

export const deletePatient = async (req: Request, res: Response) => {
  try {
    const id = req.params.id;
    const user = await db.query(`DELETE FROM patient where id = $1`, [id]);
    if (user.rowCount === 0) {
      res.status(404).json({ message: "Пациент не найден." });
    } else {
      res.status(200).json({ message: "Пациент успешно удален" });
    }
  } catch (error) {
    console.error("Что-то пошло не так");
    res
      .status(500)
      .json("Произошла ошибка при получении информации о пациенте");
  }
};
