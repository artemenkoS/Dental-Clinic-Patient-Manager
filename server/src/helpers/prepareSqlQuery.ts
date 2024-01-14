import { ParsedQs } from 'qs';

export const prepareSqlQuery = (reqQuery: ParsedQs) => {
  const { patientId, doctorId, name, surname, startDate, sort, endDate, page = 1, pageSize = 50 } = reqQuery;
  const queryParams = [];
  const totalCountQueryParams = [];
  const whereClauses = [];

  let sortQuery = ``;

  if (sort) {
    const sortItems = JSON.parse(sort as string);
    if (Array.isArray(sortItems) && sortItems.length > 0) {
      sortQuery += ' ORDER BY ';

      sortItems.forEach((item: { field: string; sort: string }, index: number) => {
        if (index > 0) {
          sortQuery += ', ';
        }

        if (item.field === 'patientId') {
          sortQuery += `"patient"."surname" ${item.sort}`;
        } else {
          sortQuery += `"visit_with_payments"."${item.field}" ${item.sort}`;
        }
      });
    }
  }

  if (patientId) {
    whereClauses.push(`"visit_with_payments"."patientId" = $${queryParams.length + 1}`);
    queryParams.push(patientId);
    totalCountQueryParams.push(patientId);
  }

  if (name) {
    whereClauses.push(`"visit_with_payments"."name" = $${queryParams.length + 1}`);
    queryParams.push(name);
    totalCountQueryParams.push(name);
  }

  if (surname) {
    whereClauses.push(`"visit_with_payments"."surname" = $${queryParams.length + 1}`);
    queryParams.push(surname);
    totalCountQueryParams.push(surname);
  }

  if (doctorId) {
    whereClauses.push(`"visit_with_payments"."doctorId" = $${queryParams.length + 1}`);
    queryParams.push(doctorId);
    totalCountQueryParams.push(doctorId);
  }

  if (startDate && endDate) {
    whereClauses.push(
      `"visit_with_payments"."visitDate" BETWEEN $${queryParams.length + 1} AND $${queryParams.length + 2}`
    );
    queryParams.push(startDate, endDate);
    totalCountQueryParams.push(startDate, endDate);
  } else if (startDate) {
    whereClauses.push(`DATE("visit_with_payments"."visitDate") = $${queryParams.length + 1}`);
    queryParams.push(startDate);
    totalCountQueryParams.push(startDate);
  }

  const offset = (+page - 1) * +pageSize;

  let query = `
    SELECT "visit_with_payments".*, "patient"."surname"
    FROM visit_with_payments
    JOIN patient ON "visit_with_payments"."patientId" = "patient"."id"
  `;

  let totalCountQuery = `SELECT count(*) FROM visit_with_payments`;

  if (whereClauses.length > 0) {
    query += ` WHERE ${whereClauses.join(' AND ')}`;
    totalCountQuery += ` WHERE ${whereClauses.join(' AND ')}`;
  }

  query += ` ${sortQuery ? sortQuery : 'ORDER by "visitDate" desc'} LIMIT $${queryParams.length + 1} OFFSET $${
    queryParams.length + 2
  }`;

  queryParams.push(pageSize, offset);

  return { query, queryParams, totalCountQuery, totalCountQueryParams };
};
