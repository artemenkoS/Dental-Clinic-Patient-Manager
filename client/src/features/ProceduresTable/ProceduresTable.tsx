import { Button, Table, TableBody, TableCell, TableContainer, TableFooter, TableHead, TableRow } from '@mui/material';
import React from 'react';

import { Procedure } from '../../api/visit/types';
import { theme } from '../../styles/theme';

interface Props {
  procedures: Procedure[];
  onDelete: (i: number) => void;
  disabled?: boolean;
}

export const ProceduresTable: React.FC<Props> = ({ procedures, onDelete, disabled }) => {
  const totalSum = procedures.reduce((acc, procedure) => acc + +procedure.sum, 0);

  return (
    <TableContainer sx={{ fontSize: theme.spacing(3) }}>
      <Table>
        <TableHead>
          <TableRow>
            <TableCell>Название процедуры</TableCell>
            <TableCell>Сумма</TableCell>
            <TableCell />
          </TableRow>
        </TableHead>
        <TableBody>
          {procedures.map((item, index) => (
            <TableRow key={index}>
              <TableCell>{item.label}</TableCell>
              <TableCell>{item.sum} ₸.</TableCell>
              <TableCell>
                <Button variant="outlined" onClick={() => onDelete(index)} disabled={disabled}>
                  Удалить
                </Button>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
        <TableFooter>
          <TableRow>
            <TableCell align="right" colSpan={3}>
              Итого к оплате: {totalSum} ₸.
            </TableCell>
          </TableRow>
        </TableFooter>
      </Table>
    </TableContainer>
  );
};

export default ProceduresTable;
