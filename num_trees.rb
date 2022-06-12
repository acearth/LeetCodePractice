# Q-96: get unique BST trees count by DP
# (Pure math method is removed)
def num_trees(n)
  dp = [0] * (n + 1)
  dp[0] = 1
  (1..n).each do |i|
    (1..i).each do |j|
      dp[i] += dp[i - j] * dp[j - 1]
    end
  end
  dp[n]
end