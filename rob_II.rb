# Q-214: rob game in cycle
def rob(nums)
  return nums.max if nums.size < 3
  dpa, dpb = [-1] * nums.size, [0] * nums.size
  dpa[-1], dpb[0] = nums[0], 0
  dpa[0], dpb[1] = [nums[0], nums[1]].max, nums[1]
  (1...nums.size).each do |i|
    dpa[i] = [dpa[i - 1] + nums[i], dpa[i - 1]].max
    dpb[i] = [dpb[i - 1] + nums[i], dpb[i - 1]].max
  end
  [dpa[nums.size - 1], dpb.last].max
end
