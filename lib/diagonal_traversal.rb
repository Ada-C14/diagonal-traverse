
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
  return matrix.flatten if matrix.length <= 1
  m = matrix.length
  n = matrix[0].length
  r = 0
  c = 0
  diagonal = []
  # direction = false
  (m * n).times do
    diagonal << matrix[r][c]

    if (r + c).even?
      if c == n - 1
        r += 1
      elsif r == 0
        c += 1
      else
        c += 1
        r -= 1
      end
    else
      if r == m - 1
        c += 1
      elsif c == 0
        r += 1
      else
        c -= 1
        r += 1
      end
    end
  end

  return diagonal
end