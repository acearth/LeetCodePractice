def rob(nums)
  return 0 if nums.size==0
  return nums.max if nums.size<4
  income=Array.new
  income[3]=nums[0..2].max
  income[4]=[nums[0]+nums[2],nums[1]+nums[3]].max
  for i in 4..nums.size-1
    v1=rob1(nums[0..i-1])
    v2=rob1(nums[1..i])
    v3 = v1==rob1(nums[1..i-2])? rob1(nums[0..i]):0
    income[i+1]=[v1,v2,v3].max
  end
  income.last
end

def rob1(nums)
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
a=1,3,1,3,100
b=1,2,7,9,1
p rob a
p rob b
