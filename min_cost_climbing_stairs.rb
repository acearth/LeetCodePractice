# Q-746: DP
# dp[i]: arrived to i-th stair, how many cost is taken?
def min_cost_climbing_stairs(cost)
  dp = [0] * cost.size
  dp[0] = cost[0]
  dp[1] = cost[1]
  (2...cost.size).each do |i|
    dp[i] = cost[i] + [dp[i - 1], dp[i - 2]].min
  end
  # Cautious here! Last step can be skip, since we
  # defined i-th step of dp[i] is required to take!
  [dp[-1], dp[-2]].min
end
