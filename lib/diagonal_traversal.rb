
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
    while r >= 0 && c < cols  #keep going up diagonally until out of bounds
      result << matrix[r][c]
      return result if r == rows - 1 && c == cols - 1
      c += 1
      r -= 1
    end
    if c >= cols #reverse step and move down when hitting the right boundary
      c -= 1
      r += 2
    end
    r += 1 if r < 0 #move down if hitting top boundary

    while c >= 0 && r < rows #keep going down diagonally out of bounds
      result << matrix[r][c]
      return result if r == rows - 1 && c == cols - 1
      c -= 1
      r += 1
    end
    if r >= rows #reverse step and move right when hitting bottom boundary
      r -= 1
      c += 2
    end
    c += 1 if c < 0 #move right when hitting left boundary
  end
  return []
end

