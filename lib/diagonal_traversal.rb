
# Input:  A matrix of M x N elements (M rows, N columns), 
# Return value:  All elements of the matrix in diagonal order.
#  Example input:
# [
#  [ 1, 2, 3 ],
#  [ 4, 5, 6 ],
#  [ 7, 8, 9 ]
# ]
# Example Output:  [1, 2, 4, 7, 5, 3, 6, 8, 9]

# a row 0, column 0
# b row 0, column 1
# e row 1, column 0
# i row 2, column 0
# f row 1, column 1
# c row 0, column 2
# d row 0, column 3
# g row 1, column 2
# j row 2, column 1
# k row 2, column 2
# h row 1, column 3
# l row 2, column 3

# as rows increase, columns decrease
# as rows decrease, columns increase

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