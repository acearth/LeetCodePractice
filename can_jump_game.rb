# Q55: can jump? check for each step coverage
def can_jump(nums)
  max = 0
  (nums.size - 1).times do |i|
    max = [max, nums[i] + i].max
    return true if max >= nums.size - 1
    return false if max <= i
  end
  true
end