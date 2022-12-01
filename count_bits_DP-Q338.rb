# Q-338: bits count from 0 to n.
# DP solution is optimal
# @param {Integer} n
# @return {Integer[]}
def count_bits(n)
  base = 1
  dp = [0]
  (1..n).each do |i|
    base *= 2 if i == base
    dp[i] = dp[i - base] + 1
  end
  dp
end
