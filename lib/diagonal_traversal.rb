
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
  r = 0
  c = 0
  rows = matrix.length
  cols = matrix[0].length
  result = []
  while  c < cols && r < rows
    while r >= 0 && c < cols
      result << matrix[r][c]
      return result if r == rows - 1 && c == cols - 1
      c += 1
      r -= 1
    end
    if c >= cols
      c -= 1
      r += 2
    end
    r += 1 if r < 0
    while c >= 0 && r < rows
      result << matrix[r][c]
      return result if r == rows - 1 && c == cols - 1
      c -= 1
      r += 1
    end
    if r >= rows
      r -= 1
      c += 2
    end
    c += 1 if c < 0
  end
  return []
end

