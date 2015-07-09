earch(nums, target)
  return -1 if nums.size<1
  return specSearch(nums, 0, nums.size, target)
end

def specSearch(nums, l, h, target)
  m=(l+h)/2
  return m if nums[m]==target
=begin
  if nums[l]==target
    return l
  elsif nums[h-1]==target
    return h-1
=end
  if h-l<2
    return -1
  end
  if nums[l]<nums[m]
    if tBelongs(nums, l, m+1, target)
      return bisearch(nums, l, m, target)
    else
      return specSearch(nums, m+1, h, target)
    end

  else
    if tBelongs(nums, m+1, h, target)
      return bisearch(nums, m+1, h, target)
    else
      return specSearch(nums, l, m, target)
    end
  end
end

def tBelongs(nums, l, h, target)
  return nums[l]==target if h-l<1
  if target>=nums[l]&&target<=nums[h-1]
    return true
  end
  return false
end

def bisearch(nums, l, h, target)
  m=(l+h)/2
  if nums[m]==target
    return m
  elsif h-l<2
    return -1
  elsif nums[m]>target
    return bisearch(nums, l, m, target)
  else
    return bisearch(nums, m+1, h, target)
  end
end

a=[5, 1, 3]

p search a, 3
a=[1, 3]
p search a, 2
a=[3, 1]
p search a, 3
a=[4, 5, 6, 7, 0, 1, 2]
p search a, 0

puts

a=[2, 3, 4, 5, 6, 7, 8, 9, 1]

p search a, 9
