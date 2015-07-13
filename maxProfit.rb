def max_profit(prices)
  profit=Array.new
  (prices.size-2).times do |i|
    profit<<prices[i+1]-prices[i]
  end
  prof=findMaxSubArray(profit,0,profit.size)
end

def getLargestSumWithMid(arr,l,h)
  m=(h+l)/2
  sum=0
  lsum=0
  lcur=nil
  i=m
  until i<l
    sum+=arr[i]
    if sum>lsum
      lsum=sum
      lcur=i
    end
  end
  rsum=0
  rcur=nil
  i=m+1
  sum=0
  while i<h
    sum+=arr[i]
    if sum>rsum
      rcur=i
      rsum=sum
    end
  end
  return [lcur,rcur,lsum+rsum]
end
def findMaxSubArray(arr,l,h)
  if h==l
    return [l,h,arr[l]]
  else
    m=(l+h)/2
    al=findMaxSubArray(arr,l,m)
    ar=findMaxSubArray(arr,m,h)
    ac=getLargestSumWithMid(arr,l,h)
    return al if lsum>=rsum&&lsum>=csum
    return ar if rsum>=lsum&&rsum>=csum
    return ac
  end
end


a=[-5,11,-4,13,-4,-2]
#p max_profit a
