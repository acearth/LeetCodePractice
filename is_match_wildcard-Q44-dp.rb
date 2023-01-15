# Q-44: wildcard matching DP
# revised at 15/jan/2023
# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  dp = (1 + s.size).times.map { [false] * (1 + p.size) }
  dp[0][0] = true
  p.size.times { |j| dp[0][j + 1] = p[j] == '*' && dp[0][j] }
  s.chars.each_with_index do |cs, i|
    p.chars.each_with_index do |cp, j|
      if cs == cp || cp == '?'
        dp[i + 1][j + 1] = dp[i][j]
      elsif cp == '*'
        # NOTE:    (1) "abd" v. "ab*d" (2) "abc" v. "ab*" (3) "abcccc" v. "ab*"
        # NOTE:    (1) "abd" v. "ab*d" (2) "abc" v. "ab*" (3) "abcccc" v. "ab*"
        # dp[i + 1][j + 1] = dp[i + 1][j] || dp[i][j] || dp[i][j + 1]
        # Also, in case(2), dp[i+1][j+1] EQ to dp[i][j]; also dp[i+1][j+1] EQ to dp[i][j+1]
        dp[i + 1][j + 1] = dp[i + 1][j] || dp[i][j + 1]
      end
    end
  end
  dp.last.last
end
