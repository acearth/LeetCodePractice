# Q-121: constraint: buy and sell ONLY once!
def max_profit(prices)
  profit, buy = 0, prices[0]
  (1...prices.size).each do |i|
    if prices[i] > buy
      profit = [prices[i] - buy, profit].max
    else
      buy = prices[i]
    end
  end
  profit
end

# @note DP
# state-0: Don't buy and hold the cash, count the cash's amount. Use 0 - prices[i] since we don't know the balance
# state-1: After potential sell, how many profix can be gained?
def max_profit_dp(prices)
  dp = prices.size.times.map { [0, 0] }
  dp[0] = [-prices[0], 0]
  (1...prices.size).each do |i|
    dp[i][0] = [dp[i - 1][0], -prices[i]].max
    dp[i][1] = [dp[i - 1][1], prices[i] + dp[i - 1][0]].max
  end
  dp[-1][-1]
end