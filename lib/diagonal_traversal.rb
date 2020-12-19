
# Input:  A matrix of M x N elements (M rows, N columns), 
# Return value:  All elements of the matrix in diagonal order.
#  Example input:
# [
#  [ 1, 2, 3 ], -->  [0][0], [0][1], [0][2]
#  [ 4, 5, 6 ], -->  [1][0], [1][1], [1][2]
#  [ 7, 8, 9 ]  -->  [2][0], [2][1], [2][2]
# ]
# Example Output:  [1, 2, 4, 7, 5, 3, 6, 8, 9]

# Time Complexity - O(nm)
# Space Complexity - O(nm)

def diagonal_traversal(matrix)
  return [] if matrix[0].empty?

  row_length = matrix.length
  col_length = matrix[0].length
  diagonals = []

  row_length.times do |i|
    col_length.times do |j|
      index_sum = i + j

      if diagonals[index_sum].nil?
        diagonals[index_sum] = Array.new # initialize diagonal array if new
      end

      if index_sum.even?
        diagonals[index_sum].unshift(matrix[i][j]) # even-indexed diagonals should be reversed
      else
        diagonals[index_sum] << matrix[i][j]
      end
    end
  end

  return diagonals.flatten
end