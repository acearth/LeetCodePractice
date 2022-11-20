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

# Q-81: Worst case: nums[left] == nums[mid] == nums[right], then time complexity is O(n)
# @param {Integer[]} nums
# @param {Integer} target
# @return {Boolean}
def search(nums, target)
  search_range(nums, 0, nums.size - 1, target)
end

def search_range(nums, left, right, target)
  return false if left > right
  return nums[left] == target if left == right
  m = (left + right) / 2
  return true if [nums[left], nums[m], nums[right]].include? target
  if nums[left] < nums[m]
    if nums[m] > target && target > nums[left]
      return search_range(nums, left + 1, m - 1, target)
    else
      return search_range(nums, m + 1, right - 1, target)
    end
  elsif nums[m] < nums[right]
    if nums[m] < target && target < nums[right]
      return search_range(nums, m + 1, right - 1, target)
    else
      return search_range(nums, left + 1, m - 1, target)
    end
  else
    return search_range(nums, left + 1, m - 1, target) || search_range(nums, m + 1, right - 1, target)
  end
end