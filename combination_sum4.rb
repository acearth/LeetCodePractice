# Q-377: complete pack,  order of pack is cared.
# Need to handle traversal order
def combination_sum4(nums, target)
  dp = [1] + [0] * target
  (0..target).each do |c|
    nums.each do |n|
      dp[c] += dp[c - n] if c >= n
    end
  end
  dp.last
end