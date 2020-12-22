# Time Complexity O(r * c), i have two loops that are dependent on r and c
# Space Complexity O(r * c), because all elements from the matrix will be saved inside the result array.

def diagonal_traversal(matrix)
  return matrix.first if matrix.length == 1

  r_length = matrix.length
  c_length = matrix.first.length
  r = 0
  c = 0
  result = []
  result << matrix[r][c] # first element
  (r_length + c_length - 1).times do
    # if we're at the right side of the matrix
    # down diagonal
    if c == matrix.first.length - 1 && r < matrix.length - 1
      r += 1
      r, c = down_diagonal(matrix, c, r, result)
      # if we're on the top of the matrix
      # down diagonal

    elsif r == 0 && c >= 0
      c += 1
      r, c = down_diagonal(matrix, c, r, result)
      # if we're on the bottom of the matrix
      # up diagonal
    elsif r == matrix.length - 1 && c < matrix.first.length - 1
      c += 1
      r, c = up_diagonal(matrix, c, r, result)
      # if we're on the left side of the matrix
      # up diagonal
    elsif r > 0 && c == 0
      r += 1
      r, c = up_diagonal(matrix, c, r, result)
    end
  end
  return result
end

def down_diagonal(matrix, c, r, result)
  until c == 0 || r == matrix.length - 1
    result << matrix[r][c]
    c -= 1
    r += 1
  end
  result << matrix[r][c]
  return r, c
end

def up_diagonal(matrix, c, r, result)
  until r == 0 || c == matrix.first.length - 1
    result << matrix[r][c]
    c += 1
    r -= 1
  end
  result << matrix[r][c] if matrix[r]
  return r, c
end
