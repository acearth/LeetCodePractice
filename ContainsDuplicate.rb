def contains_duplicate(nums)
  a=Hash.new
  tag=0
  for key in nums
    if a[key]==nil
      a[key]=1
    else
      tag=1
      break
    end
  end
  if tag==0
    return false
  else
    return true
  end
end

p contains_duplicate([1,2,3,3])
