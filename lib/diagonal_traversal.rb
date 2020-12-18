
def diagonal_traversal(matrix)
  rows= matrix.length
  columns = matrix[0].length
  array = []

  column_index = 0
  row_index = 0
  diagonals = rows + columns - 1
  trips = 0
  until trips == diagonals do
    if trips % 2 == 0
      column_index += 2 if row_index == rows
      column_index += 1 if column_index < 0
      row_index -= 1 if row_index == rows
      until row_index < 0 || column_index == columns
        array << matrix[row_index][column_index]
        row_index -= 1
        column_index += 1 if column_index < columns
      end
    else
      row_index += 2 if column_index == columns && row_index <= 0
      row_index += 1 if row_index < 0

      column_index -= 1 if column_index == columns
      until column_index < 0 || row_index == rows
        array << matrix[row_index][column_index]
        row_index += 1 if row_index < rows
        column_index -= 1
      end
    end
    trips += 1
  end
  return array
end
