import { Box, FormControl, FormHelperText, InputLabel, Select, SelectChangeEvent } from '@mui/material';
import * as React from 'react';

interface Props {
  label: string;
  value: string;
  onChange: (value: string) => void;
  children: React.ReactNode;
  disabled?: boolean;
  error?: string | undefined;
}

export const FormSelect: React.FC<Props> = (props) => {
  const { label, value, onChange, children, error, disabled } = props;

  return (
    <Box sx={{ minWidth: 120 }}>
      <FormControl fullWidth error={!!error}>
        <InputLabel>{label}</InputLabel>
        <Select
          value={value?.toString()}
          label={label}
          onChange={(event: SelectChangeEvent) => onChange(event.target.value)}
          disabled={disabled}
        >
          {children}
        </Select>
        {error && <FormHelperText>{error}</FormHelperText>}
      </FormControl>
    </Box>
  );
};
