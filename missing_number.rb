def missing_number(nums)
  nums.each { |n| place(nums, n) if nums[n]!=n }
  nums.each_with_index { |n, i| return i if i!=n }
  nums.size
end

def place(nums, n)
  if nums[n]!=nil && nums[n]!=n
    t=nums[n]
    nums[n]=n
    place(nums, t)
  end
end


