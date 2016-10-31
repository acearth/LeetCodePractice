def three_sum(nums)
  nums.sort!
  len, res = nums.length, []
  len.times do |base|
    break if nums[base] > 0
    next if base > 0 && nums[base] == nums[base - 1]
    left, right = base + 1, len - 1
    while left < right
      if (sum = nums[left] + nums[right] + nums[base]) == 0
        res << [nums[base], nums[left], nums[right]]
        right -= 1 while nums[right] == nums[right - 1]
        left += 1 while nums[left] == nums[left + 1]
        left, right = left + 1, right - 1
      elsif sum > 0
        right -= 1
      else
        left += 1
      end
    end
  end
  res
end
