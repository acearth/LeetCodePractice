# Q-163: missing ranges in phases
# 31/dec/2022
# @param {Integer[]} nums
# @param {Integer} lower
# @param {Integer} upper
# @return {String[]}
def find_missing_ranges(nums, lower, upper)
  i = 0
  i += 1 while i < nums.size && nums[i] < lower
  result = []
  last = lower - 1
  nums.each do |n|
    result << range(last + 1, n) if last + 1 != n
    last = n
  end
  result << range(last + 1, upper + 1) if last < upper
  result
end

def range(start, tail)
  return start.to_s if start == tail - 1
  "#{start}->#{tail - 1}"
end
