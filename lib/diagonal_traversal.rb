# Input:  A matrix of M x N elements (M rows, N columns),
# Return value:  All elements of the matrix in diagonal order.
#  Example input:
# [
#  [ 1, 2, 3 ],
#  [ 4, 5, 6 ],
#  [ 7, 8, 9 ]
# ]
# Example Output:  [1, 2, 4, 7, 5, 3, 6, 8, 9]

# PSEUDOCODE:
# row and col vars
# start at (0, 0)
# we want to go up and to the right OR down and to the left
# if can't go up:
# if can go right, go right else go down
# decrement col and increment row until can't go down AND left
# if can't go down, go right; else go down
# decrement row and increment col until... (repeat)
# repeat until hit row max, col max

# Time: O(n) (where n is the total num of items in the matrix - or rows * cols)
# >> go through every item in the matrix
# Space: O(n)
# >> collect every item in the matrix in a 1d output array

def traverse_top_right_bottom_left(row_ind, col_ind, matrix, diagonals)
  until row_ind == matrix.size || col_ind < 0
    diagonals << matrix[row_ind][col_ind]
    row_ind += 1
    col_ind -= 1
  end

  return row_ind - 1, col_ind + 1
end

def traverse_bottom_left_top_right(row_ind, col_ind, matrix, diagonals)
  until row_ind < 0 || col_ind == matrix[0].size
    diagonals << matrix[row_ind][col_ind]
    row_ind -= 1
    col_ind += 1
  end

  return row_ind + 1, col_ind - 1
end

def diagonal_traversal(matrix)
  # raise NotImplementedError, "This method has not yet been implemented"
  return [] if matrix.empty? || matrix[0].empty?

  row_ind = 0
  col_ind = 0
  diagonals = [matrix[row_ind][col_ind]]

  until row_ind == matrix.size - 1 && col_ind == matrix[0].size - 1
    if row_ind == 0
      if col_ind < matrix[0].size - 1
        col_ind += 1
      else
        row_ind += 1
      end

      row_ind, col_ind = traverse_top_right_bottom_left(row_ind, col_ind, matrix, diagonals)
    else
      if col_ind < matrix[0].size && row_ind < matrix.size - 1
        row_ind += 1
      else
        col_ind += 1
      end

      row_ind, col_ind = traverse_bottom_left_top_right(row_ind, col_ind, matrix, diagonals)
    end
  end

  return diagonals
end
