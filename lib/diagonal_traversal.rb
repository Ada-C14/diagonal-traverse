
# Input:  A matrix of M x N elements (M rows, N columns), 
# Return value:  All elements of the matrix in diagonal order.
#  Example input:
# [
#  [ 1, 2, 3 ],
#  [ 4, 5, 6 ],
#  [ 7, 8, 9 ]
# ]
# Example Output:  [1, 2, 4, 7, 5, 3, 6, 8, 9]

# solution based algorithm from:
# https://www.geeksforgeeks.org/print-matrix-diagonal-pattern/?ref=rp

def diagonal_traversal(matrix)
  m = matrix.length
  n = matrix[0].length
  result = []

  i = 0
  j = 0

  is_up = true

  until result.length == m * n
    if is_up
      while i >= 0 && j < n do
        result << matrix[i][j]
        # up and right
        i -= 1
        j += 1
      end

      if i < 0 && j < n
        i = 0
      end

      if j == n
        i += 2
        j -= 1
      end
    
    else
      while j >= 0 && i < m do
        result << matrix[i][j]
        # down and left
        i += 1
        j -= 1
      end

      if j < 0 && i < m
        j = 0
      end

      if i == m
        j += 2
        i -= 1
      end
    end

    is_up = !is_up
  end

  return result

end

# input = [
#  [ 1, 2, 3 ],
#  [ 4, 5, 6 ],
#  [ 7, 8, 9 ]
# ]

# print diagonal_traversal(input)