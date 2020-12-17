
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
  i = 0 # row
  j = 0 # column

  num_rows = matrix.length
  num_columns = matrix[i].length

  diagonal_array = []

  until diagonal_array.length == num_rows * num_columns
    # up-right arrow
    while i >= 0 && j < num_columns
      diagonal_array << matrix[i][j]
      i -= 1
      j += 1
    end

    # Too far up (negative row), so increment row to get back on the matrix
    i += 1

    # Too far to the right (past last column), so decrement column to get back on matrix
    # Increment row again (twice from previous step)
    if j == num_columns
      i += 1
      j -= 1
    end

    # down-left arrow
    while j >= 0 && i < num_rows
      diagonal_array << matrix[i][j]
      i += 1
      j -= 1
    end

    # Too far left (negative column), so increment column to get back on the matrix
    j += 1

    # Too far down (past last row), so decrement row to get back on matrix
    # Increment column again (twice from previous step)
    if i == num_rows
      i -= 1
      j += 1
    end
  end

  return diagonal_array
end

# # Leetcode solution
# def diagonal_traversal(matrix)
#     diagonal_array = []
#
#     row = 0
#     column = 0
#
#     n = matrix.length
#     m = matrix[0].length
#
#     going_upward = true # if traversing up-right, false if traversing down-left
#     while row < n && column < m
#       diagonal_array << matrix[row][column]
#       new_row = row + (going_upward ? -1 : 1)
#       new_column = column + (going_upward ? 1 : -1)
#
#       # If at the end of diagonal, check if next element is within bounds
#       if new_row < 0 || new_column < 0 || new_row == n || new_column == m
#         if going_upward # If at tail-end of traversing upward-right, find next head to switch to downward-left
#           # "if [i, j + 1] is within bounds, then it becomese the next head.
#           # Otherwise, the element directly below i.e. the element [i + 1, j] becomes the next head"
#           row += (column == m - 1 ? 1 : 0)  # if at the last column, next element is directly below
#           column += (column < m - 1 ? 1 : 0) # if NOT at the last column, next element is the next column
#
#         else # If at tail-end of traversing downward-left, find next head to switch to upward-right
#           # "if [i + 1, j] is within bounds, then it becomes the next head.
#           # Otherwise, the element directly below i.e. the element [i, j + 1] becomes the next head"
#           column += (row == n - 1 ? 1 : 0) # If at the last row, the next element is the next column
#           row += (row < n - 1 ? 1 : 0) # If NOT at the last row, the next element is directly below
#         end
#
#         going_upward = !going_upward
#
#       else
#         row = new_row
#         column = new_column
#       end
#     end
#
#   return diagonal_array
# end