# Q-1143: LCS: easy DP
def longest_common_subsequence_2D(text1, text2)
  dp = (1 + text1.size).times.map { [0] * (1 + text2.size) }
  (1..text1.size).each do |i|
    (1..text2.size).each do |j|
      if text1[i - 1] == text2[j - 1]
        dp[i][j] = 1 + dp[i - 1][j - 1]
      else
        dp[i][j] = [dp[i - 1][j], dp[i][j - 1]].max
      end
    end
  end
  dp.last.last
end

# space compress!
def longest_common_subsequence(s, t)
  dp = [0] * (1 + t.size)
  (1..s.size).each do |i|
    pre = dp[0]
    (1..t.size).each do |j|
      cur = dp[j]
      if s[i - 1] == t[j - 1]
        dp[j] = 1 + pre
      else
        dp[j] = [dp[j], dp[j - 1]].max
      end
      pre = cur
    end
  end
  # p dp
  dp.last
end

p longest_common_subsequence('abcde', 'ace') == 3
p longest_common_subsequence("ezupkr", "ubmrapg")
p longest_common_subsequence("ezupkr", "ubmrapg") == 2
p longest_common_subsequence("abcba", "abcbcba") == 5
p longest_common_subsequence("bsbininm", "jmjkbkjkv") == 1