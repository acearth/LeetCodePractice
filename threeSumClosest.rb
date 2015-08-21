def three_sum_closest(nums, target)
  nums.sort!
  min=2**31-1
  result=nil
  for i in 0..nums.size-3
    for j in i+1..nums.size-2
      k=target-nums[i]-nums[j]
      ki=bisearch(nums, j+1, nums.size, k)
      t=nums[i], nums[j], nums[ki]
      distance=(nums[ki]-k).abs
      return target if distance==0
      if min>distance
        result=t
        min=distance
      end
    end
  end
  result.inject(:+)
end

def bisearch(nums, l, h, target)
  m=(l+h)/2
  if target==nums[m]
    return m
  elsif h-l<3
    d=Hash.new
    for i in l..h-1
      d[i]=(target-nums[i]).abs
    end
    mv=d[l]
    mi=l
    d.each do |k, v|
      if mv>v
        mi=k
      end
    end
    return mi
  elsif target>nums[m]
    return bisearch(nums, m+1, h, target)
  else
    return bisearch(nums, l, m, target)
  end
end
