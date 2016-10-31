def max_profit(prices)
  buy, profit = 2**32, 0
  prices.each { |sell| buy > sell ? buy = sell : profit = [profit, sell - buy].max }
  profit
end
