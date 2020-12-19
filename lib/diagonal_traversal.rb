require 'pry'
# Input:  A matrix of M x N elements (M rows, N columns), 
# Return value:  All elements of the matrix in diagonal order.
#  Example input:
# [
#  [ 1, 2, 3 ],
#  [ 4, 5, 6 ],
#  [ 7, 8, 9 ]
# ]
# Example Output:  [1, 2, 4, 7, 5, 3, 6, 8, 9]

# time complexity: O(n)
# space complexity: O(n)
def diagonal_traversal(matrix)
  row = 0
  column = 0
  diagonal = []
  row_adjust = -1
  column_adjust = 1

  until diagonal.length == matrix.flatten.length
    diagonal << matrix[row][column]
    row += row_adjust
    column += column_adjust

    flip = flip(row, column, matrix.length, matrix[0].length)
    if flip
      row = flip[:row]
      column = flip[:column]
      row_adjust *= -1
      column_adjust *= -1
    end
  end

  return diagonal
end

def flip(row, column, row_count, column_count)
  if row == row_count
    row -= 1
    column += 2
  elsif column == column_count
    column -= 1
    row += 2
  elsif row < 0
    row += 1
  elsif column < 0
    column += 1
  else
    return false
  end

  return { row: row, column: column }
end