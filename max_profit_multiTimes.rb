def max_profit(prices)
  sign=Array.new
  (prices.length-1).times do|i|
    sign[i]=(prices[i+1]<=>prices[i])
  end
  delta=0
  sign.length.times do|i|
    if sign[i]>-1
      delta+=prices[i+1]-prices[i]
    end
  end
  return delta
end

ar=[3,8,9,6,7]
p max_profit(ar)

