# line by line and col by col scan but passed in ruby.
# Acceptable but bad for training. Could be seen in interview.
def search_matrix(matrix, target)
  startLine = 0
  tailColumn = matrix[0].size
  while startLine < matrix.size && tailColumn > 0
    cur = matrix[startLine][tailColumn - 1]
    return true if cur == target
    if cur < target
      startLine += 1
    else
      tailColumn -= 1
    end
  end
  return false
end

m = [
  [1, 4, 7, 11, 15],
  [2, 5, 8, 12, 19],
  [3, 6, 9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30]
]
p search_matrix(m, 5)
p search_matrix(m, 20)

# Q-240: row ordered, column ordered
def search_matrix(matrix, target)
  search(matrix, [0, matrix.size], [0, matrix.first.size], target)
end

def search(matrix, updown, leftright, target)
  up, down = updown
  left, right = leftright
  if up + 1 == down
    return matrix[up].bsearch { |e| target <=> e } != nil
  elsif left + 1 == right
    return (up...down).bsearch { |i| target <=> matrix[i][left] } != nil
  else
    m, n = (up + down) / 2, (left + right) / 2
    return true if matrix[m][n] == target
    if matrix[m][n] < target
      return search(matrix, [m, down], leftright, target) || search(matrix, [up, m], [n, right], target)
    else
      return search(matrix, [up, m], leftright, target) || search(matrix, [m, down], [left, n], target)
    end
  end
end

# @note: for binary search, we can implement it by line by line scanning, could be easier for impl.
#   Binary search's complexity is
#   log(n) + log(n-1)+ ... + log(1)=log(n)*log(n-1)*...*log(1)
#   =log(n!) , also < nlog(n).
#   Rarely seen.

# Q-240: speed up by removing checking from 3/4 grid to 2/4 :: vertical checking
# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  search_vertical(matrix, 0, matrix.size, 0, matrix.first.size, target)
end

def vertical_search_column(matrix, col, up, down, target)
  while up < down
    m = (up + down) / 2
    return m if matrix[m][col] == target
    if matrix[m][col] < target
      up = m + 1
    else
      down = m
    end
  end
  up
end

def search_vertical(matrix, up, down, left, right, target)
  return false unless up < down && left < right
  return false unless matrix[up][left] <= target && target <= matrix[down - 1][right - 1]
  col = (left + right) / 2
  row = vertical_search_column(matrix, col, up, down, target)
  return true if row < down && matrix[row][col] == target
  search_vertical(matrix, row, down, left, col, target) || search_vertical(matrix, up, row, col + 1, right, target)
end