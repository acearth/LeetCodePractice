def can_jump(nums)
  return nums.size>0 if nums.size<2
  max=0
  nums[0..-2].each_with_index do |n, i| 
    max=n+i if max<n+i
    return false if max<=i
    return true if max+1>=nums.size
  end
end
a=[2,3,1,1,4]
p can_jump(a)==true
a=[3,2,1,0,4]
p can_jump(a)==false
a=[0,2,3]
p can_jump(a)==false

