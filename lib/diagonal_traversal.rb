
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

  return [] if matrix.empty? || matrix[0].empty?

  n = matrix.length
  m = matrix[0].length
  row = 0
  column = 0
  upward = true  #variable will indicate the direction; moving up if true, moving down if false
  diagonal_traversal = []

  while row < n and column < m
    diagonal_traversal << matrix[row][column]

    #[a, b] -> [a - 1, b + 1] if going down // [a, b] -> [a + 1 , b - 1] if going up
    next_row = row + (upward ? -1 : 1)
    next_column = column + (upward ? 1 : -1)

    if next_row < 0 || next_row == n || next_column < 0 || next_column == m
      #if current diagonal is "moving up"
      if upward
        #checking if next element is valid and/or setting the next head for moving up diagonal
        if column == m - 1
          row += 1
        else
          column += 1
        end
      else
        #checking if next element is valid and/or setting the next head for moving down diagonal
        if row == n - 1
          column += 1
        else
          row += 1
        end
      end
      upward = !upward #change direction
    else
      row = next_row
      column = next_column
    end
  end

  return diagonal_traversal
end