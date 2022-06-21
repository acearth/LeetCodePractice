# Q-309: buy stock and cooldown ONE day after sold
# state 0: buy on today or keep hold stock;
# state 1: sell on today;
# state 2: cooldown day, sold on yesterday;
def max_profit(prices)
  dp = prices.size.times.map { [0, 0, 0] }
  dp[0] = [-prices[0], 0, 0]
  (1...prices.size).each do |i|
    dp[i][0] = [dp[i - 1][0], dp[i - 1][2] - prices[i]].max
    dp[i][1] = [dp[i - 1][1], dp[i - 1][0] + prices[i]].max
    dp[i][2] = dp[i - 1][1]
  end
  dp.last.max
end