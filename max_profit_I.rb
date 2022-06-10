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