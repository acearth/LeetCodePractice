# note:
# 1. find the latest num which is before the descending series: nums[i]
# 2. if found nums[i](i >= 0 )find latest num which is larger than nums[i], named nums[j], swap nums[i,j]
# 3. reverse the remaining series after i
#
# The hard point: the series is handled twice, so it's hard to find the method
def next_permutation(nums)
  i, j = nums.size - 2, nums.size - 1
  i -= 1 while i >= 0 && nums[i] >= nums[i + 1]
  if i >= 0
    j -= 1 while nums[j] <= nums[i]
    nums[i], nums[j] = nums[j], nums[i]
  end
  nums[i + 1..-1] = nums[i + 1..-1].reverse
  nums
end
