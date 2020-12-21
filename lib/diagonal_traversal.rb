
# Input:  A matrix of M x N elements (M rows, N columns), 
# Return value:  All elements of the matrix in diagonal order.
#  Example input:
# [
#  [ 1, 2, 3 ],
#  [ 4, 5, 6 ],
#  [ 7, 8, 9 ]
# ]
# Example Output:  [1, 2, 4, 7, 5, 3, 6, 8, 9]
#
# def diagonal_traversal(matrix)
#   # raise NotImplementedError, "This method has not yet been implemented"
#   return matrix.first if matrix.length == 1
#
#   result = []
#   # r_last_index = matrix.length - 1
#   # c_last_index = matrix.first.length - 1
#
#   r = 0
#   c = 0
#   result = matrix[r][c]
#   c += 1
#   until r == matrix.length - 1 && c == matrix.first.length - 1
#     if (r >= 0 && c == 0) || r == matrix.length - 1
#       until r == 0 || c == matrix.first.length - 1
#         # up diagonal
#         result << matrix[r][c]
#         p 'first loop'
#         p [r, c]
#         r -= 1
#         c += 1
#       end
#       result << matrix[r][c]
#       if c >= matrix.first.length - 1
#         p 'does this execute?'
#         r += 1
#         c = matrix.first.length - 1
#       else
#         r = 0
#       end
#       p 'first if'
#       p [r, c]
#
#
#     end
#
#     if (r == 0 && c != 0) || c == matrix.first.length - 1
#       until c == 0 || r == matrix.length - 1
#         # down diagonal
#         result << matrix[r][c]
#         p 'second loop'
#         p [r, c]
#         r += 1
#         c -= 1
#       end
#       result << matrix[r][c]
#       if r >= matrix.length - 1
#         c += 1
#         r = matrix.length - 1
#       else
#         c = 0 if c < 0
#         c = matrix.first.length - 1 if c > matrix.first.length - 1
#       end
#       p 'second if'
#       p [r, c]
#
#     end
#   end
#
#   return result
# end

#
# p diagonal_traversal([["a"]])





# r = 0, c = 0
# r = r + 1, c = 0
# r - i, c + i until r == 0
# need to first loop by row
# then loop by column?
#
# r = 0, c = 0
# if r == 0 && c != 0 || c == matrix.first.length - 1
#   down diagonal
# if r >= 0 && c == 0 || r == matrix.length - 1
#   up diagonal
# if r == matrix.length - 1
# number of iterations is equal to matrix.length + matrix.first.length - 1
#
def diagonal_traversal(matrix)
  return matrix.first if matrix.length == 1
  r_length = matrix.length
  c_length = matrix.first.length
  r = 0
  c = 0
  result = []
  result << matrix[r][c]
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
  result << matrix[r][c]
  return r, c
end

input = [
    [ 1, 2, 3 ],
    [ 4, 5, 6 ],
    [ 7, 8, 9 ]
]

# Act
p diagonal_traversal(input)