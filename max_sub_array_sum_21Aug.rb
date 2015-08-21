def max_sub_array(nums)
  max=value=nums[0]
  nums[1..-1].each do |n|
    value= value+n > n ? value+n : n
    max=value if value>max
  end
  max
end
