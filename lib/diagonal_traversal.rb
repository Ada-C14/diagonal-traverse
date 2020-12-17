
# Input:  A matrix of M x N elements (M rows, N columns), 
# Return value:  All elements of the matrix in diagonal order.
#  Example input:
# [
#  [ 1, 2, 3 ],
#  [ 4, 5, 6 ],
#  [ 7, 8, 9 ]
# ]
# Example Output:  [1, 2, 4, 7, 5, 3, 6, 8, 9]

def diagonal_traversal(matrix)
  num_rows = matrix.length
  num_columns = matrix[0].length
  diagonal = Array.new

  movement = :up
  current_row = 0
  current_column = 0

  (num_rows * num_columns).times do
    diagonal << matrix[current_row][current_column]

    if movement == :up
      if current_row <= 0 || current_column == num_columns - 1
        movement = :down
        if current_column == (num_columns - 1)
          current_row += 1
        else
          current_column += 1
        end
      else
        current_row -= 1
        current_column += 1
      end

    elsif movement == :down

      if current_column <= 0 || current_row == (num_rows - 1)
        movement = :up
        if current_row == (num_rows - 1)
          current_column += 1
        else
          current_row += 1
        end
      else
        current_row += 1
        current_column -= 1
      end


    end

  end

  return diagonal
end