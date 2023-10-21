import EditIcon from "@mui/icons-material/Edit";
import { IconButton } from "@mui/material";

import { useAppDispatch } from "../../store/hooks";
import {
  setEditVisitModalOpened,
  setEditableVisit,
} from "../../store/slices/modalsSlice";
import { Visit } from "../../api/visit/types";

interface Props {
  visit: Visit;
}

export const EditVisitButton: React.FC<Props> = ({ visit }) => {
  const dispatch = useAppDispatch();
  const onClick = () => {
    dispatch(setEditableVisit(visit));
    dispatch(setEditVisitModalOpened(true));
  };
  return (
    <IconButton onClick={onClick}>
      <EditIcon />
    </IconButton>
  );
};

// () => dispatch(setPatientModalOpened(true))
