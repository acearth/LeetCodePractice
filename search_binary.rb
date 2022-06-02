# Q-704: binary search
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  left, right = 0, nums.size
  while left != right
    mid = (left + right) / 2
    if nums[mid] == target
      return mid
    elsif nums[mid] > target
      right = mid
    else
      left = mid + 1
    end
  end
  -1
end
