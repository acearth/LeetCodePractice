# Q-647: count palindromes in a string
# dp[i][j]={true|false}, indicates s[i..j] is palindrome or not
# dp[i][j]=true if s[i]==s[j], and dp[i+1][j-1] is true
def count_substrings(s)
  dp = s.size.times.map { [false] * s.size }
  result = 0
  (s.size - 1).downto(0) do |i|
    i.upto(s.size - 1) do |j|
      if j - i < 2
        dp[i][j] = s[i] == s[j]
      else
        dp[i][j] = s[i] == s[j] && dp[i + 1][j - 1]
      end
      result += 1 if dp[i][j]
    end
  end
  result
end