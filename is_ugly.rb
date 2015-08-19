def is_ugly(num)
  return false if num<1
  return true if num==1
  d=[2,3,5]
  i=0
  while num>1
    if num%d[i]==0
      num/=d[i]
    else
      break if i==2
      i+=1
    end
  end
  num==1
end

p is_ugly(5)
p is_ugly(24)
p is_ugly(14)
