# Q-494: 0-1 pack
# (1) bag - something = target
# (2) bag + something = nums.sum
# (1) + (2) ==> bag = (nums.sum + target)/2
def find_target_sum_ways(nums, target)
  return 0 if target.abs > nums.sum || (nums.sum + target).odd?
  bag = (nums.sum + target) / 2
  dp = [1] + [0] * bag # set dp[0] = 1 and padding bag-size zeros
  nums.each_with_index do |n, i|
    bag.downto(n) do |j|
      dp[j] += dp[j - n]
    end
  end
  dp[bag]
end
