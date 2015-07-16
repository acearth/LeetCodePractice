def four_sum(nums, target)
  nums.sort!
  twoMerge=Array.new
  h=Hash.new
  rh=Hash.new
  for i in 0..nums.size-2
    for j in i+1..nums.size-1
      t=nums[i]+nums[j]
      twoMerge.push t
      if h[t]==nil
        h[t]=[[i,j]]
      else
        h[t].push [i,j]
      end
    end
  end
  twoMerge.sort!
  twoMerge.uniq!
  for i in 0..nums.size-4
    for j in i+1..nums.size-3
      k=target-nums[i]-nums[j]
      ki=bisearch(twoMerge,0,twoMerge.size,k)
      if ki>-1
        h[twoMerge[ki]].each do |i1,i2|
          t=nums[i],nums[j],nums[i1],nums[i2]
          rh[t]=true if i1>j
        end
      end
    end
  end
  res=Array.new
  rh.each do |k,v|
    res.push k if v==true
  end
  res
end

def bisearch(nums, l, h, target)
  return -1 if l==h
  m=(l+h)/2
  return m if target==nums[m]
  if target>nums[m]
    return -1 if m+1==h
    return bisearch(nums, m+1, h, target)
  else
    return -1 if l==m
    return bisearch(nums, l, m, target)
  end
end
ar=1,0,-1,0,-2,2
p four_sum ar,0
p four_sum [-3,-2,-1,0,0,1,2,3],0
p four_sum [4,0,-5,-1,-5,2,-3],-5
