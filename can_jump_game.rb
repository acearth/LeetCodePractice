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

# Q-55: jump game: care about further, don't care how we get to current position
def can_jump(nums)
  reach = 0
  nums.each_with_index do |step, i|
    return false if reach < i
    reach = [reach, step + i].max
  end
  true
end