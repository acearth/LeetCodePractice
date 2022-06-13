# Q-674 easy DP for longest continuous Incresing subseq.
def find_length_of_lcis(nums)
  dp=[1]*nums.size
  max=1
  (1...nums.size).each do |i|
    dp[i]=dp[i-1]+1 if nums[i]>nums[i-1]
    max=dp[i] if dp[i]>max
  end
  max
end
