# Q-583: 2-D dp status
def min_distance(word1, word2)
  dp = (1 + word1.size).times.map { [0] * (1 + word2.size) }
  word2.size.times { |j| dp[0][j + 1] = j + 1 }
  word1.chars.each_with_index do |cs, i|
    dp[i + 1][0] = i + 1
    word2.chars.each_with_index do |ct, j|
      if cs == ct
        dp[i + 1][j + 1] = dp[i][j]
      else
        dp[i + 1][j + 1] = [dp[i + 1][j], dp[i][j + 1]].min + 1
      end
    end
  end
  dp.last.last
end

# Q-583: 1-D dp status
def min_distance(word1, word2)
  dp = (0..word2.size).to_a
  word1.chars.each_with_index do |cs, i|
    upleft, dp[0] = dp[0], i + 1 #important
    word2.chars.each_with_index do |ct, j|
      up = dp[j + 1]
      dp[j + 1] = cs == ct ? upleft : [dp[j + 1], dp[j]].min + 1 # dp[j] means left element in same layer
      upleft = up
    end
  end
  dp.last
end

p min_distance(word1 = "sea", word2 = "eat") == 2