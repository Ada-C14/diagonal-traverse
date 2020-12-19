
# Input:  A matrix of M x N elements (M rows, N columns), 
# Return value:  All elements of the matrix in diagonal order.
#  Example input:
# [
#  [ 1, 2, 3 ], -->  [0][0], [0][1], [0][2]
#  [ 4, 5, 6 ], -->  [1][0], [1][1], [1][2]
#  [ 7, 8, 9 ]  -->  [2][0], [2][1], [2][2]
# ]
# Example Output:  [1, 2, 4, 7, 5, 3, 6, 8, 9]

def diagonal_traversal(matrix)
  return [] if matrix[0].empty?

  row_length = matrix.length
  col_length = matrix[0].length
  diagonals = []

  row_length.times do |i|
    col_length.times do |j|
      diagonal = i + j

      if diagonals[diagonal].nil?
        diagonals[diagonal] = Array.new
      end

      if diagonal.even?
        diagonals[diagonal].unshift(matrix[i][j])
      else
        diagonals[diagonal] << matrix[i][j]
      end
    end
  end

  return diagonals.flatten
end