import { DataGrid, DataGridProps } from '@mui/x-data-grid';

import { Wrapper } from './styled';

export const PaginatedTable: React.FC<DataGridProps> = ({ paginationModel, ...props }) => {
  return (
    <Wrapper>
      <DataGrid
        {...props}
        initialState={{
          pagination: {
            paginationModel,
          },
        }}
        paginationMode="server"
        sortingMode="server"
        pageSizeOptions={[10, 25, 50, 100]}
      />
    </Wrapper>
  );
};
