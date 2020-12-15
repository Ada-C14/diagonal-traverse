# frozen_string_literal: true

# O(M x N) time and space complexity for M rows x N columns element matrix
# while loop will visit each element of the matrix once, and == # elements in whole matrix (row x column)
# return array has length dependent on number of elements in whole matrix (row x column)
#



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
  array = []
  return array if matrix.empty? || matrix[0].empty?

  i = 0
  j = 0

  switch = 0 # 0 for up, 1 for down

  while i + j < (matrix.length - 1) + (matrix[0].length - 1)
    array << matrix[i][j]

    # check for which direction
    if switch.zero?

      # will go out of bounds, must switch
      if j + 1 == matrix[0].length || (i - 1).negative?
        # for cases when switching at rhs of matrix
        if j + 1 == matrix[0].length
          i += 1

        # switch at top row
        elsif (i - 1).negative?
          j += 1
        end
        switch = 1  # go down
      else
        # proceed up diagonal
        i -= 1
        j += 1
      end
    elsif switch == 1
      # will go out of bounds, must switch
      if i + 1 == matrix.length || (j - 1).negative?
        # for cases when switching at bottom of matrix
        if i + 1 == matrix.length
          j += 1
        # for cases when switching at lhs of matrix
        elsif (j - 1).negative?
          i += 1
        end
        switch = 0 # go up
      else
        # proceed as usual
        j -= 1
        i += 1
      end
    end

  end

  # add last element and return
  array << matrix[i][j]
  array
end