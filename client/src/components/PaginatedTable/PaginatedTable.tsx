import { DataGrid, GridColDef, GridPaginationModel, GridSortModel, GridValidRowModel } from '@mui/x-data-grid';

import { Wrapper } from './styled';

interface Props {
  columns: GridColDef[];
  rows: GridValidRowModel[];
  paginationModel: Partial<GridPaginationModel>;
  rowCount: number;
  onPaginationChange: (e: GridPaginationModel) => void;
  onSortModelChange?: (e: GridSortModel) => void;
  loading?: boolean;
}

export const PaginatedTable: React.FC<Props> = ({
  columns,
  rows,
  paginationModel,
  rowCount,
  onPaginationChange,
  onSortModelChange,
  loading,
}) => {
  return (
    <Wrapper>
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
        sortingMode="server"
        disableRowSelectionOnClick
        onPaginationModelChange={onPaginationChange}
        onSortModelChange={onSortModelChange}
        pageSizeOptions={[10, 25, 50, 100]}
        loading={loading}
      />
    </Wrapper>
  );
};
