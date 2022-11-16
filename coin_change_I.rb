# Q-322
# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
  dp = [2 ** 32] * (1 + amount)
  dp[0] = 0
  coins.each do |c|
    (c..amount).each do |j|
      dp[j] = [dp[j], dp[j - c] + 1].min
    end
  end
  dp.last == 2**32 ? -1 : dp.last
end

p coin_change([1, 2, 5], 11)