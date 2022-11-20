# Q-33: binary search (left and right inclusive)
# @param {Integer[]} nums # rotated and sorted
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  left, right = 0, nums.size - 1
  while left <= right
    m = (left + right) / 2
    return m if nums[m] == target
    if nums[left] <= nums[m]
      if nums[m] > target && target >= nums[left]
        right = m - 1
      else
        left = m + 1
      end
    else
      if target > nums[m] && target <= nums[right]
        left = m + 1
      else
        right = m - 1
      end
    end
  end
  -1
end