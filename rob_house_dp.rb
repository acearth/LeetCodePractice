def rob(nums)
  return 0 if nums.size==0
  return nums[0] if nums.size==1
  income=Array.new
  income[0]=nums[0]
  income[1]=[nums[0], nums[1]].max
  if nums.size>2
    income[2]=[nums[0]+nums[2], nums[1]].max
    for i in 3..nums.size-1
      income[i]=[income[i-3]+nums[i], income[i-2]+nums[i], income[i-1]].max
    end
  end
  income.last
end

nums=1, 3, 8, 7, 5, 2, 4
p rob nums
nums=1, 7, 9,4
p rob nums
nums=1, 1, 2, 1
p rob nums

