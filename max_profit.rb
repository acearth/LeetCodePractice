def max_profit(prices)
  buy_price, profit = 2**32, 0
  prices.each { |price| buy_price > price ? buy_price = price : profit = [profit, price - buy_price].max }
  profit
end
