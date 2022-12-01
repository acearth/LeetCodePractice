# Q-259: two pointers
#  1/dec/2022
#  NOTE: check how result is added!
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_smaller(nums, target)
  nums.sort!
  result = 0
  nums.each_with_index do |n, i|
    left, right = i + 1, nums.size - 1
    while left < right
      sum = n + nums[left] + nums[right]
      if sum >= target
        right -= 1
      else
        result += right - left
        left += 1
      end
    end
  end
  result
end
