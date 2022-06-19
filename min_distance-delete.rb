# Q-583: delete to be equal for two words
# * dp[i][j]： distance from word1[0..i-1] to words2[0..j-1]
# *   if word1[i]==word2[j], then dp[i+1][j+1] = dp[i][j]
#     else dp[i+1][j+1] shall came from
#       either: word1[0..i] to word2[0..j-1] + word2[j]  ==> dp[i+1][j] + 1
#       or: word1[0..i-1] to word2[0..j] + word1[i] ==> dp[i][j+1] + 1
# * dp[0][0]: from null of word1 to null of word2, they are same: so dp[0][0]=0
# * dp[0][j]: from null of word1 to first char of word2, need add one char: dp[0][1]=1; so dp[0][j]=j
# * dp[j][0]: from first j(equals to length(Word0..j-1)) to null of word2: dp[j][0]=j;
def min_distance(word1, word2)
  dp = (1 + word1.size).times.map { |i| [i] + [0] * word2.size }
  word2.size.times { |j| dp[0][j + 1] = j + 1 }
  word1.chars.each_with_index do |c1, i|
    word2.chars.each_with_index do |c2, j|
      if c1 == c2
        dp[i + 1][j + 1] = dp[i][j]
      else
        dp[i + 1][j + 1] = 1 + [dp[i + 1][j], dp[i][j + 1]].min
      end
    end
  end
  p dp
  dp.last.last
end