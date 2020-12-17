# Time complexity: O(n2), it depends on the length of the row and the number of the row, so it is O(n) * O(m) --> O(n2).
# Space complexity: O(n2), the length of the return result is the total elements in the matrix, so it is O(n) * O(m) --> O(n2).

def diagonal_traversal(matrix)
  return [] if matrix.empty?
  m = matrix.length 
  n = matrix[0].length
  round = 0
  row = 0
  col = 0
  result = [matrix[row][col]]
  # to pass leetcode's Time Limit Exceeded, I added these two conditions
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
    result.push(matrix[row][col]) if !matrix[row].nil? && !matrix[row][col].nil? 
  end
  return result
end