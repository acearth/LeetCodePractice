max_sub_array(nums)
  value=0
  max=nums[0]

  for k in nums
    if k<0
      if value+k <k
        value=k
      else
        value+=k
      end
    else
      value=0 if value<0
      value+=k
    end
    max=value  if value>max
  end
  return max
end

a=[-2, 1, -3, 4, -1, 2, 1, -5, 4]
b=[1, 2, 3]
p max_sub_array (a)
p max_sub_array (b)
p max_sub_array [-1]
