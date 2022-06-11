# Q-343: integer break: DP, the FORM!
def integer_break(n)
  dp = [0, 0, 1] + [0] * n # set dp[2]=1
  (3..n).each do |i|
    (2..n - 1).each do |j|
      dp[i] = [dp[i], dp[i - j] * j, (i - j) * j].max
    end
  end
  dp[n]
end
