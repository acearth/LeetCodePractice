# Q-416: 0-1 pack DP
def can_partition(nums)
  return false if nums.sum.odd?
  bag=nums.sum/2
  dp=[0]*(1+bag)
  nums.each_with_index do |n,i|
    bag.downto(n) do |j|
      dp[j]=[dp[j],dp[j-n]+n].max
    end
  end
  dp[bag]==bag
end
