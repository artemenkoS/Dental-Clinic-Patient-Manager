import { ParsedQs } from "qs";

export const prepareSqlQuery = (reqQuery: ParsedQs) => {
  const {
    patientId,
    doctorId,
    name,
    surname,
    startDate,
    endDate,
    page = 1,
    pageSize = 10,
  } = reqQuery;
  const queryParams = [];
  const totalCountQueryParams = [];
  const whereClauses = [];

  if (patientId) {
    whereClauses.push(`"patientId" = $${queryParams.length + 1}`);
    queryParams.push(patientId);
    totalCountQueryParams.push(patientId);
  }

  if (name) {
    whereClauses.push(`"name" = $${queryParams.length + 1}`);
    queryParams.push(name);
    totalCountQueryParams.push(name);
  }

  if (surname) {
    whereClauses.push(`"surname" = $${queryParams.length + 1}`);
    queryParams.push(surname);
    totalCountQueryParams.push(surname);
  }

  if (doctorId) {
    whereClauses.push(`"doctorId" = $${queryParams.length + 1}`);
    queryParams.push(doctorId);
    totalCountQueryParams.push(doctorId);
  }

  if (startDate && endDate) {
    whereClauses.push(
      `"visitDate" BETWEEN $${queryParams.length + 1} AND $${
        queryParams.length + 2
      }`
    );
    queryParams.push(startDate, endDate);
    totalCountQueryParams.push(startDate, endDate);
  } else if (startDate) {
    whereClauses.push(`DATE("visitDate") = $${queryParams.length + 1}`);
    queryParams.push(startDate);
    totalCountQueryParams.push(startDate);
  }

  const offset = (+page - 1) * +pageSize;

  let query = `SELECT * FROM visit `;
  let totalCountQuery = `SELECT count(*) FROM visit`;

  if (whereClauses.length > 0) {
    query += ` WHERE ${whereClauses.join(" AND ")}`;
    totalCountQuery += ` WHERE ${whereClauses.join(" AND ")}`;
  }

  query += ` ORDER BY "visitDate" ASC`;

  query += ` LIMIT $${queryParams.length + 1} OFFSET $${
    queryParams.length + 2
  }`;

  console.log(query);
  queryParams.push(pageSize, offset);

  return { query, queryParams, totalCountQuery, totalCountQueryParams };
};
