# Q-63: unique_paths_with_obstacles: DP easy
def unique_paths_with_obstacles(grid)
  m, n = grid.size, grid.first.size
  dp = m.times.map { |_| [0] * n }
  dp[0][0] = 1 - grid[0][0]
  (1...m).each do |i|
    dp[i][0] = grid[i][0] == 1 ? 0 : dp[i - 1][0]
  end
  (1...n).each do |i|
    dp[0][i] = grid[0][i] == 1 ? 0 : dp[0][i - 1]
  end
  (1...m).each do |i|
    (1...n).each do |j|
      dp[i][j] = grid[i][j] == 1 ? 0 : dp[i][j - 1] + dp[i - 1][j]
    end
  end
  dp[-1][-1]
end