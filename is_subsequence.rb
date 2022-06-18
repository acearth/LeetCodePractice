# Q-392: easy DP
def is_subsequence(s, t)
  dp = (1 + s.size).times.map { [0] + [0] * t.size }
  s.chars.each_with_index do |cs, i|
    t.chars.each_with_index do |ct, j|
      if cs == ct
        dp[i + 1][j + 1] = dp[i][j] + 1
      else
        dp[i + 1][j + 1] = [dp[i + 1][j], dp[i][j + 1]].max
      end
    end
  end
  dp.last.last == s.size
end
