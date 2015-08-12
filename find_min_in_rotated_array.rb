def find_min(nums)
  h=nums.length-1
  m=nums.length/2
  if h==0
    return nums[0]
  elsif h==1
    if nums[0]<nums[1]
      return nums[0]
    else
      return nums[1]
    end
  end
  t=Array.new
  if nums[m]>nums[h]
    t=nums[m..h]
  else
    t=nums[0..m]
  end
  return find_min(t)
end

arr=[4, 5, 6, 7, 1, 2, 3]

p find_min arr
p find_min [0]
p find_min [2, 0]
p find_min [1, 2, 3, 4]

