def diagonal_traversal(matrix)
  return [] if matrix.empty? || (matrix.length == 1 && matrix[0].empty?)
  runs = (matrix.length - 1) + (matrix[0].length - 1)
  direction_up = true
  round = 0
  row = 0
  col = 0
  result = [matrix[row][col]]
  while round <= runs && row >= 0 && col >= 0
    if direction_up
      col += 1
      if (row-1) >= 0 && !matrix[row].nil? && (row + col) != runs
        row -= 1
      else
        if row == 0
          direction_up = false
          round += 1 
        else
          row -= 1
        end
      end
    else
      row += 1
      if (col-1) >= 0 && !matrix[row].nil? && (row + col) != runs
        col -= 1
      else
        if col == 0 
          direction_up = true
          round += 1 
        else
          col -= 1
        end
      end
    end
    result.push(matrix[row][col]) if !matrix[row].nil? && !matrix[row][col].nil? 
  end
  return result
end