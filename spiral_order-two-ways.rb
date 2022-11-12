# Q-54:  spiral order : multi-solutions
# @param {Integer[][]} matrix
# @return {Integer[]}
# created on 3/june/2022
def spiral_order(matrix)
  up, down, left, right = 0, matrix.size - 1, 0, matrix.first.size - 1
  i, j, out = 0, 0, []
  while up <= down && left <= right
    while (left..right).include?(j) && (up..down).include?(i)
      out << matrix[i][j]
      j += 1
    end
    i, j = i + 1, j - 1
    up += 1
    # V-increase
    while (left..right).include?(j) && (up..down).include?(i)
      out << matrix[i][j]
      i += 1
    end
    i, j = i - 1, j - 1
    right -= 1
    #H-decrease
    while (left..right).include?(j) && (up..down).include?(i)
      out << matrix[i][j]
      j -= 1
    end
    i, j = i - 1, j + 1
    down -= 1
    #V-decrease
    while (left..right).include?(j) && (up..down).include?(i)
      out << matrix[i][j]
      i -= 1
    end
    i, j = i + 1, j + 1
    left += 1
  end
  out
end

# created on 2015
def spiral_order_recursively(matrix)
  return matrix.flatten if matrix.size < 2 || matrix[0].size < 2
  result, stack = matrix.shift, []
  (matrix.size - 1).times do |i|
    stack << matrix[i].shift
    result << matrix[i].pop
  end
  result + matrix.pop.reverse + stack.reverse + spiral_order(matrix)
end


# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  result = []
  moves = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  cur = 0
  m, n = matrix.size, matrix.first.size
  adjust = [[1, -1], [-1, -1], [-1, 1], [1, 1]]
  di, dj = moves[0]
  i = j = 0
  while result.size < m * n
    if i < 0 || j < 0 || i >= m || j >= n || matrix[i][j] == 2**32
      i, j = i + adjust[cur][0], j + adjust[cur][1]
      cur = (cur + 1) % 4
      di, dj = moves[cur]
    end
    result << matrix[i][j]
    matrix[i][j] = 2**32
    i, j = i + di, j + dj
  end
  result
end
