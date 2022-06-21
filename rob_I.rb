# Q-198: rob game
def rob(nums)
  return nums.max if nums.size < 3
  dp = [0] * nums.size
  dp[0] = nums[0]
  dp[1] = nums[0] > nums[1] ? nums[0] : nums[1]
  (2...nums.size).each { |i| dp[i] = [dp[i - 2] + nums[i], dp[i - 1]].max }
  dp.last
end
