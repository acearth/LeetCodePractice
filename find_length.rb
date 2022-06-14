# Q-718: dp with compresso table
def find_length_dp2d_raw(nums1, nums2)
  dp = nums1.size.times.map { [0] * nums2.size }
  nums1.size.times { |i| dp[i][0] = nums1[i] == nums2[0] ? 1 : 0 }
  nums2.size.times { |j| dp[0][j] = nums1[0] == nums2[j] ? 1 : 0 }
  (1...nums1.size).each do |i|
    (1...nums2.size).each do |j|
      next unless nums1[i] == nums2[j]
      dp[i][j] = dp[i - 1][j - 1] + 1
    end
  end
  dp.map { |line| line.max }.max
end

def find_length_dp2d(nums1, nums2)
  dp = (1 + nums1.size).times.map { [0] * (1 + nums2.size) }
  (1..nums1.size).each do |i|
    (1..nums2.size).each do |j|
      next unless nums1[i - 1] == nums2[j - 1]
      dp[i][j] = dp[i - 1][j - 1] + 1
    end
  end
  dp.map { |line| line.max }.max
end

def find_length_dp1d(nums1, nums2)
  dp = [0] * (1 + nums2.size)
  max = 0
  (1..nums1.size).each do |i|
    (nums2.size).downto(1) do |j|
      dp[j] = nums1[i - 1] == nums2[j - 1] ? dp[j - 1] + 1 : 0
    end
    max = [max, dp.max].max # @note: max maybe covered, so update it ASAP
  end
  max
end

# p find_length_dp1d([1, 2, 3, 2, 1], [1, 2, 3, 4, 7]) == 3
# p find_length_dp1d([1, 2, 3, 2, 1], [3, 2, 1, 4, 7]) == 3
# p find_length_dp1d([0, 0, 0, 0, 0, 0, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 1, 0, 0])