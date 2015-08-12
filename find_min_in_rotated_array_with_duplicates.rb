# Need to analyze different situations when have cut point
def find_min(nums)
  return nums[0] if nums.size==1
  return nums[0]>nums[1] ? nums[1] : nums[0] if nums.size==2
  m=nums.size/2
  return find_min(nums[0..m]) if nums[0]<nums[-1]
  m1=find_min(nums[0..m])
  m2=find_min(nums[m..-1])
  m1>m2 ? m2 : m1
end
