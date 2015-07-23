def max_sub_array(nums)
  return -2**32 if nums.size==0
  mid=nums.size/2
  return nums[0] if mid==0
  answer=[max_sub_array(nums[0..mid-1]),max_sub_array(nums[mid..-1])].max
  now,may=nums[mid],nums[mid]
  (mid-1).downto(0){|i| may=[may,now+=nums[i]].max }
  now=may
  (mid+1..nums.size-1).each{ |i| may=[may,now+=nums[i]].max}
  [may,answer].max
end

p max_sub_array [1,2]
p max_sub_array [-3,2]
