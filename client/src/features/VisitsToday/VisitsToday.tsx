import { CircularProgress, Pagination, Typography } from "@mui/material";
import format from "date-fns/format";
import { ru } from "date-fns/locale";
import React, { useState } from "react";
import toast from "react-hot-toast";

import { useGetDoctorsQuery } from "../../api/doctor/doctorApi";
import { useGetVisitsQuery } from "../../api/visit/visitApi";
import { DeleteVisitButton } from "../../components/DeleteVisitModal/DeleteVisitButton";
import { EditVisitButton } from "../EditVisit/EditVisitButton";
import { getTodayDate } from "../../helpers/getTodayDate";
import { List, Slot, Wrapper } from "./styled";

export const VisitsToday = () => {
  const todayDate = getTodayDate();

  const [page, setPage] = useState<number>(1);

  const {
    data: visits,
    isLoading,
    isSuccess,
    isError,
  } = useGetVisitsQuery({ startDate: todayDate, page }); // Use the page state here
  const { data: doctors } = useGetDoctorsQuery();

  const handlePaginationChange = (
    _: React.ChangeEvent<unknown>,
    value: number
  ) => {
    setPage(value);
  };

  React.useEffect(() => {
    console.log(visits?.data);
    if (!visits?.data && page > 1) {
      setPage((prev) => prev - 1);
      console.log(page);
    }
  }, [visits]);

  if (isLoading) {
    return <CircularProgress />;
  }

  if (isError) {
    toast.error("Не удалось загрузить список записей."); // Use toast.error to show an error message
  }

  if (isSuccess && visits.data) {
    return (
      <Wrapper>
        <List>
          {visits.data.map((visit) => {
            const visitDate = new Date(visit.visitDate);
            const formattedDate = format(visitDate, "d MMMM HH:mm", {
              locale: ru,
            });
            const doctor = doctors?.data.find((el) => el.id === visit.doctorId);
            return (
              <Slot key={visit.id}>
                <Typography>
                  {formattedDate} Доктор {doctor?.surname}
                </Typography>
                <DeleteVisitButton id={visit.id} />
                <EditVisitButton visit={visit} />
              </Slot>
            );
          })}
        </List>
        <Pagination
          count={visits?.pagination.totalPages}
          page={page}
          variant="outlined"
          onChange={handlePaginationChange}
        />
      </Wrapper>
    );
  }

  return <Typography>{visits?.message}</Typography>;
};
