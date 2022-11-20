# Q-154: binary search
# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  min(nums, 0, nums.size - 1)
end

def min(nums, left, right)
  return nums[left..right].min if right - left < 2
  m = (left + right) / 2
  if nums[left] < nums[m]
    if nums[m] <= nums[right]
      nums[left]
    else
      min(nums, m + 1, right)
    end
  elsif nums[left] > nums[m]
    min(nums, left + 1, m)
  else
    if nums[m] == nums[right]
      [min(nums, left, m - 1), min(nums, m + 1, right)].min
    else
      min(nums, m, right)
    end
  end
end