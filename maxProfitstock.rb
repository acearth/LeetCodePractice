def max_profit(prices)
  return 0 if prices.size<2
  return [prices[1]-prices[0], 0].max if prices.size==2
  delta=Array.new
  for i in 0..prices.size-2
    delta.push prices[i+1]-prices[i]
  end
  profit=delta[0]
  curp=delta[0]
  for i in 1..delta.size-1 do
    curp=0 if curp<1
    curp+=delta[i]
    profit=curp if curp>profit
  end
  [profit,0].max
end


ar=[1, 2, 4]
p max_profit ar

ar=[2, 1]
p max_profit ar

ar=[2, 1, 4]
p max_profit ar
ar=4,2,1
p max_profit ar

