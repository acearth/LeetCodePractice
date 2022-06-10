# Q-122: buy and sell for many times
def max_profit(prices)
  profit = 0
  (1...prices.size).each do |i|
    profit += [prices[i] - prices[i - 1], 0].max
  end
  profit
end
