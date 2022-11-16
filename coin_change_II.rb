# Q-518:  complete package, item adding order is not cared here
# @param {Integer} amount
# @param {Integer[]} coins
# @return {Integer}
def change(amount, coins)
  dp = [0] * (1 + amount)
  dp[0] = 1
  coins.each do |c|
    (c..amount).each do |j|
      dp[j] += dp[j - c]
    end
  end
  dp.last
end