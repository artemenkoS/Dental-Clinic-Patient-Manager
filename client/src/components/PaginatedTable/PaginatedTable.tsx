import { DataGrid, GridColDef, GridPaginationModel, GridValidRowModel } from '@mui/x-data-grid';

interface Props {
  columns: GridColDef[];
  rows: GridValidRowModel[];
  paginationModel: Partial<GridPaginationModel>;
  rowCount: number;
  onPaginationChange: (e: GridPaginationModel) => void;
}

export const PaginatedTable: React.FC<Props> = ({ columns, rows, paginationModel, rowCount, onPaginationChange }) => {
  return (
    <DataGrid
      rows={rows}
      columns={columns}
      initialState={{
        pagination: {
          paginationModel,
        },
      }}
      rowCount={rowCount}
      paginationMode="server"
      pageSizeOptions={[5]}
      disableRowSelectionOnClick
      onPaginationModelChange={onPaginationChange}
    />
  );
};
