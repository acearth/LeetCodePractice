# question 300 LIS
# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
  dp = [1] * nums.size
  nums.size.times do |i|
    (0...i).each do |j|
      #todo-confirm: without bracket, easy to result in TLE.
      # Even with bracket, half times result in TLE.
      dp[i] = [dp[i], dp[j] + 1].max if (nums[i] > nums[j])
    end
  end
  dp.max
end

