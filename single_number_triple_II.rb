# Q-137 single number II, bit op
# 29/nov/2022
#
# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  powers = [0] * 32
  nums.each do |n|
    32.times { |i| powers[i] += n & (1 << i) }
  end
  result = 31.times.reduce(0) { |n, i| n + (powers[i] % 3 == 0 ? 0 : 1) * (2 ** i) }
  powers[-1] % 3 == 0 ? result : result - 2 ** 31
end