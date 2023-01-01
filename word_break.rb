# Q-139: word break: complete-pack DP
# Created at: june/2022
# updated at: 1/jan/2023
def word_break(s, word_dict)
  dp = [true] + [false] * s.size
  s.size.times do |i|
    word_dict.each do |word|
      start = i + 1 - word.size
      # @note: update dp[i+1] only when it's false
      dp[i + 1] ||= start >= 0 && dp[start] && s[start..i] == word
    end
  end
  dp.last
end