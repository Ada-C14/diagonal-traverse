def diagonal_traversal(matrix)
  return [] if matrix.empty?
  m = matrix.length 
  n = matrix[0].length
  round = 0
  row = 0
  col = 0
  result = [matrix[row][col]]
  # to pass leetcode's Time Limit Exceeded, I added this two conditions
  return matrix[0] if m == 1
  return result = (0...m).map {|row| matrix[row][0] } if n == 1 
  
  while round < (m + n) && row >= 0 && col >= 0
    if round.even?
      col += 1
      round += 1 if row == 0
      row -= 1 if (row-1) >= 0 
    else
      row += 1
      round += 1 if col == 0 
      col -= 1 if (col-1) >= 0 
    end
    result.push(matrix[row][col]) unless matrix[row].nil? 
  end
  result.delete(nil)
  return result
end