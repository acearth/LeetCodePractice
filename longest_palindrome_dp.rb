# Q-5: dp longest_palindrome, shall consider better solution since easily TLE in ruby
# @param {String} s
# @return {String}
def longest_palindrome(s)
  l = s.size
  dp = l.times.map { [false] * l }
  start, ending = 0, 0
  (l - 1).downto(0) do |i|
    (l - 1).downto(i) do |j|
      dp[i][j] = s[i] == s[j]
      dp[i][j] = s[i] == s[j] && dp[i + 1][j - 1] if j - i > 1
      start, ending = i, j if dp[i][j] && j -i > ending - start
    end
  end
  s[start..ending]
end
