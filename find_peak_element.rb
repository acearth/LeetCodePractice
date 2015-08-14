def find_peak_index(nums,left,right)
  return left if right-left==1
  return nums[left]>nums[right-1] ? left : right-1  if right-left==2
  m=(right+left)/2
  return m if nums[m]>nums[m-1]&&nums[m]>nums[m+1]
  return find_peak_index(nums,m,right) if nums[m]>nums[m-1]&&nums[m+1]>nums[m] || nums[m+1]>nums[m]
  return find_peak_index(nums,left,m+1)
end

def find_peak_element(nums)
  return find_peak_index(nums,0,nums.size)
end

a=[1,2,3,1]
p find_peak_element(a)
a=[1,2,4,1,5]
p find_peak_element(a)
