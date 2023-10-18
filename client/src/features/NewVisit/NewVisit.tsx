import { DevTool } from "@hookform/devtools";
import {
  Button,
  CircularProgress,
  MenuItem,
  Modal,
  Typography,
} from "@mui/material";
import format from "date-fns/format";
import * as React from "react";
import { Controller, useForm } from "react-hook-form";

import { useGetDoctorsQuery } from "../../api/doctor/doctorApi";
import { useGetProceduresQuery } from "../../api/procedure/procedureApi";
import { useGetUserQuery } from "../../api/user/userApi";
import {
  useCreateVisitMutation,
  useGetVisitsQuery,
} from "../../api/visit/visitApi";
import { DatePicker } from "../../components/DatePicker/DatePicker";
import { FormSelect } from "../../components/FormSelect/FormSelect";
import { NewPatient } from "../../components/NewPatientForm/NewPatientForm";
import { PatientAutocomplete } from "../../components/PatientAutocomplete/PatientAutocomplete";
import { useAppDispatch, useAppSelector } from "../../store/hooks";
import {
  selectedSlotSelector,
  setSelectedSlot,
} from "../../store/slices/visitSlice";
import { setBusySlots } from "../../store/slices/visitSlice";
import { AutocompleteOption } from "../../types";
import { StyledBox } from "./styled";

interface FormValues {
  visitDate: Date;
  patient: AutocompleteOption | null;
  doctorId: string;
  procedure: string;
  author: string;
}

export const NewVisit = () => {
  const [open, setOpen] = React.useState(false);
  const dispatch = useAppDispatch();

  const handleOpen = () => setOpen(true);
  const handleClose = () => {
    setOpen(false);
    dispatch(setSelectedSlot(null));
    dispatch(setBusySlots(null));
    resetForm();
  };
  const selectedTimeSlot = useAppSelector(selectedSlotSelector);

  const defaulFormValues = {
    doctorId: "",
    patient: null,
    procedure: "",
    visitDate: new Date(),
  };

  const {
    handleSubmit,
    control,
    watch,
    reset: resetForm,
    formState: { isValid },
  } = useForm<FormValues>({
    defaultValues: {
      doctorId: "",
      patient: null,
      procedure: "",
      visitDate: new Date(),
    },
  });

  const { data: user, isLoading: isUserLoading } = useGetUserQuery();
  const [mutate, { isSuccess: createVisitSuccess, reset }] =
    useCreateVisitMutation();
  const { data: doctors, isLoading: isDoctorsloading } = useGetDoctorsQuery();
  const { data: procedures, isLoading: isProceduresLoading } =
    useGetProceduresQuery();
  useGetVisitsQuery(
    {
      doctorId: watch("doctorId"),
      startDate: format(watch("visitDate"), "yyyy-MM-dd"),
    },
    { skip: !watch("doctorId") }
  );

  React.useEffect(() => {
    if (createVisitSuccess) {
      reset();
      handleClose();
    }
  }, [createVisitSuccess]);

  const onSubmit = (data: FormValues) => {
    if (user && data.patient) {
      mutate({
        doctorId: +data.doctorId,
        authorId: user.user.id,
        visitDate: `${format(
          data.visitDate,
          "yyyy-MM-dd"
        )} ${selectedTimeSlot}`,
        patientId: +data.patient.id,
        procedureId: +data.procedure,
      });
      resetForm(defaulFormValues);
    }
  };

  if (isUserLoading || isDoctorsloading || isProceduresLoading) {
    return <CircularProgress />;
  }

  return (
    <div>
      <Button onClick={handleOpen} variant="outlined" color="success">
        Создать запись
      </Button>
      <Modal keepMounted open={open} onClose={handleClose}>
        <StyledBox>
          <form onSubmit={handleSubmit(onSubmit)}>
            <Typography
              id="keep-mounted-modal-title"
              variant="h6"
              component="h2"
            ></Typography>
            <Controller
              name="doctorId"
              rules={{ required: "Доктор не выбран" }}
              control={control}
              render={({ field }) => (
                <FormSelect label="Выберите доктора" {...field}>
                  {doctors?.data.map((doctor) => (
                    <MenuItem value={doctor.id.toString()}>
                      {doctor.name} {doctor.surname}
                    </MenuItem>
                  ))}
                </FormSelect>
              )}
            />
            <Controller
              name="procedure"
              control={control}
              rules={{ required: "Процедура не выбрана" }}
              render={({ field }) => (
                <FormSelect label="Выберите процедуру" {...field}>
                  {procedures?.data.map((procedure) => (
                    <MenuItem value={procedure.id.toString()}>
                      {procedure.procedure}
                    </MenuItem>
                  ))}
                </FormSelect>
              )}
            />
            <Controller
              name="patient"
              control={control}
              rules={{ required: "Пациент не выбран" }}
              render={({ field }) => (
                <PatientAutocomplete
                  label="Выберите пациента"
                  value={field.value}
                  onChange={field.onChange}
                />
              )}
            />
            <NewPatient />
            <Controller
              name="visitDate"
              control={control}
              render={({ field }) => <DatePicker {...field} />}
            />
            <Button
              type="submit"
              variant="outlined"
              fullWidth
              disabled={!isValid}
            >
              Создать запись
            </Button>
          </form>
        </StyledBox>
      </Modal>
      <DevTool control={control} />
    </div>
  );
};
