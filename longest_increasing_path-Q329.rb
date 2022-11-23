# Q-329: graph (1) topo sort; (2) DFS
# 23/nov/2023
#
# peeling onion
# @param {Integer[][]} matrix
# @return {Integer}
def longest_increasing_path(matrix)
  m, n = matrix.size, matrix.first.size
  matrix = [[0] * n] + matrix + [[0] * n]
  (2 + m).times { |i| matrix[i] = [0] + matrix[i] + [0] }
  out = (2 + m).times.map { [0] * (n + 2) }
  leaves = []
  (1..m).each do |i|
    (1..n).each do |j|
      [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |di, dj|
        out[i][j] += 1 if matrix[i][j] < matrix[i + di][j + dj]
      end
      leaves << [i, j] if out[i][j] == 0
    end
  end

  depth = 0
  while leaves.any?
    new_leaves = []
    leaves.each do |i, j|
      [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |di, dj|
        if matrix[i + di][j + dj] < matrix[i][j]
          out[i + di][j + dj] -= 1
          new_leaves << [i + di, j + dj] if out[i + di][j + dj] == 0
        end
      end
    end
    leaves = new_leaves
    depth += 1
  end
  depth
end

def longest_increasing_path(matrix)
  cache = matrix.size.times.map { [0] * matrix.first.size }
  matrix.size.times do |i|
    matrix.first.size.times do |j|
      dfs(i, j, matrix, cache)
    end
  end
  cache.map(&:max).max
end

def dfs(i, j, matrix, cache)
  return cache[i][j] if cache[i][j] != 0
  [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |di, dj|
    x, y = i + di, j + dj
    next if x < 0 || y < 0 || x >= matrix.size || y >= matrix.first.size || matrix[x][y] <= matrix[i][j]
    cache[i][j] = [cache[i][j], dfs(x, y, matrix, cache)].max
  end
  cache[i][j] += 1
end

# p longest_increasing_path([[9, 9, 4], [6, 6, 8], [2, 1, 1]])