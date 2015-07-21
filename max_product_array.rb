def max_product(nums)
  subArray=[]
  maxP=nil
  nums.each do |n|
    if n!=0
      subArray.push n
    else
      t=getMaxProduct(subArray)
      maxP=0 if maxP==nil
      maxP=[maxP, t].max
      subArray.clear
    end
  end
  if subArray.size>0
    t=getMaxProduct(subArray)
    maxP=t if maxP==nil
    maxP=t if maxP<t
  end
  maxP
end
def getMaxProduct(arr)
  return 0 if arr.size<1
  return arr[0] if arr.size==1
  negCount=0
  arr.each do |n|
    negCount+=1 if n<0
  end
  return arr.inject(:*) if negCount.even?
  js,je=nil,nil
  for i in 0..arr.size-1
    if arr[i]<0
      js=i
      break
    end
  end
  if negCount==1
    return arr[1..-1].inject(:*) if js==0
    return arr[0..-2].inject(:*) if js==arr.size-1
    return [arr[0..js-1].inject(:*),arr[js+1..-1].inject(:*)].max
  else
    (arr.size-1).downto(0) do |i|
      if arr[i]<0
        je=i
        break
      end
    end
  end
  pro1=arr[0..je-1].inject(:*)
  pro2=arr[js+1..-1].inject(:*)
  return [pro1,pro2].max
end
a=1, 2, 3
p max_product(a)
a=1, 0, 0, 0
p max_product(a)
a=-4,-3,-2
p max_product(a)
a=3,-1,4
p max_product(a)
a=2,2,0,-1
p max_product(a)
a=0,2
p max_product(a)
a=0,-2
p max_product(a)
a=0,0,0
p max_product(a)
a=[-2,0,-1]
p max_product(a)

