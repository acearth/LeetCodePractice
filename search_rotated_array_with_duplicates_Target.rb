# analyze T(n)
#  If (may) have cut,   this program will search left and right part two. But one part without cut will only check once.
#  The part may have cut will check both sides, but the cutting point is only one. So, the time complexity is also o(log(n))
#  Is my analysis right? 
def search(nums, target)
  return nums.include?(target) if nums.size<4
  m=(nums.size-1)/2
  return true if nums[m]==target
  return search(nums[0..m-1], target)||search(nums[m+1..-1], target) if nums[m]<=nums[0]||nums[m]>=nums[-1] #may have cut
  return search(nums[0..m-1], target) if nums[m] > target
  return search(nums[m+1..-1], target) if nums[m] < target
end
