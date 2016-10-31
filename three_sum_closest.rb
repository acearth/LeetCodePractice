def three_sum_closest(nums, target)
  nums.sort!
  diff = 2 ** 32
  nums.each_with_index do |n, i|
    left, right = i + 1, nums.length - 1
    while left < right
      cur_diff = target - nums[left] - nums[right] - n
      return target if cur_diff == 0
      diff = cur_diff if cur_diff.abs < diff.abs
      cur_diff > 0 ? left += 1 : right -= 1
    end
  end
  target - diff
end
