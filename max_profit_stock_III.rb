def max_profit(prices)
  return 0 if prices.size<2
  pro=[]
  0.upto(prices.size-2).each { |i| pro[i]=prices[i+1]-prices[i] }
  start, endi=0, nil
  max, curSum=0, 0
  pstart=0
  pro.each_with_index do |n, i|
    curSum+=n
    (curSum=0; pstart=i+1) if curSum<=0
    (endi=i; start=pstart; max=curSum) if curSum>=max
  end
  smallestIndex=start
  (start..endi).each { |i| smallestIndex = i if pro[i]<pro[smallestIndex] }
  innerMax=getMaxSub(pro, start, smallestIndex)+getMaxSub(pro, smallestIndex+1, endi+1)
  otherMax=[getMaxSub(pro, 0, start), getMaxSub(pro, endi+1, pro.size)].max
  [otherMax+max, innerMax].max
end

def getMaxSub(nums, i, j) ## j :: untangible upper
  curSum, max=0, 0
  i.upto(j-1).each do |i|
    curSum+=nums[i]
    curSum=0 if curSum<0
    max=curSum if curSum>max
  end
  max
end
