
# Input:  A matrix of M x N elements (M rows, N columns), 
# Return value:  All elements of the matrix in diagonal order.
#  Example input:
# [
#  [ 1, 2, 3 ],
#  [ 4, 5, 6 ],
#  [ 7, 8, 9 ]
# ]
# Example Output:  [1, 2, 4, 7, 5, 3, 6, 8, 9]

# TC: O(nm) where n = num rows, m = num columns
# SC: O(nm) since returning a new array
def diagonal_traversal(matrix)
  num_rows = matrix.length
  num_columns = matrix[0].length
  diagonal = Array.new

  directionality = :northeast
  current_row = 0
  current_column = 0

  #will need to add as many elements to diagonal[] as there are in the matrix, ie the area (length * width)
  (num_rows * num_columns).times do
    # add current value to array to be returned
    diagonal << matrix[current_row][current_column]

    #determine what next value should be. First, look at the direction of traversal
    if directionality == :northeast
      unless current_row <= 0 || current_column == num_columns - 1
        #if row != first (0) && column != last (right-most), move up and to the right (northeast)
        current_row -= 1
        current_column += 1
      else
        #change the direction of traversal if at a bound (top-most row, or right-most column)
        directionality = :southwest
        if current_column == (num_columns - 1)
          #if in the last column: move down to start traversal in other direction
          current_row += 1
        else
          #if in the first row and not in the last column: move right to start traversal in other direction
          current_column += 1
        end
      end

    elsif directionality == :southwest
      unless current_column <= 0 || current_row == (num_rows - 1)
        #if column != first && row != last, move down and to the left (southwest)
        current_row += 1
        current_column -= 1
      else
        #change the direction of traversal if at a bound (left-most column or bottom-most row)
        directionality = :northeast
        if current_row == (num_rows - 1)
          #if in the bottom row: move right to start traversal in other direction
          current_column += 1
        else
          #if in rightmost column and not in bottom row: move down to start traversal in other direction
          current_row += 1
        end
      end
    end

  end

  return diagonal
end