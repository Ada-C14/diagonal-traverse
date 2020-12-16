
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
  return [] if matrix.empty? || (matrix.length == 1 && matrix[0].empty?)
  runs = (matrix.length - 1) + (matrix[0].length - 1)
  up = true
  round = 0
  row = 0
  col = 0
  result = [matrix[row][col]]
  while (row + col) == round && round <= runs && row >= 0 && col >= 0
    if up
      if (row-1) >= 0 && (col+1) >= 0 && !matrix[row].nil? && matrix[row-1][col+1]
        row -= 1
        col += 1
      elsif (row-1) >= 0 && (col+1) >= 0 && matrix[row].nil? && (row + col) != runs
        row -= 1
        col += 1
      else
        if row == 0
          col += 1
          up = false
          round += 1 
        else
          row -= 1
          col += 1
        end
      end
    else
      if (row+1) >= 0 && (col-1) >= 0 && !matrix[row+1].nil? && matrix[row+1][col-1]
        row += 1
        col -= 1
      elsif (row+1) >= 0 && (col-1) >= 0 && matrix[row+1].nil? && (row + col) != runs
        row += 1
        col -= 1
      else
        if col == 0 && (row + col) != runs
          row += 1
          up = true
          round += 1 
        else
          row += 1
          col -= 1
        end
      end
    end
    if !matrix[row].nil? && !matrix[row][col].nil? 
      result.push(matrix[row][col]) 
    end
  end
  return result
end