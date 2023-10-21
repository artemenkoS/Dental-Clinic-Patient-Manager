import { Button } from "@mui/material";
import { useAppDispatch } from "../../store/hooks";
import { setEditVisitModalOpened } from "../../store/slices/modalsSlice";
import { theme } from "../../styles/theme";

export const NewVisitButton: React.FC = () => {
  const dispatch = useAppDispatch();
  const onClick = () => {
    dispatch(setEditVisitModalOpened(true));
  };
  return (
    <Button
      onClick={onClick}
      variant="outlined"
      color="success"
      sx={{ height: theme.spacing(4) }}
    >
      Создать запись
    </Button>
  );
};
