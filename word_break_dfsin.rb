def word_break(s, word_dict)
  dp = [true] + [false] * s.size
  (1..s.size).each do |i|
    0.upto(i) do |j|
      next if !word_dict.include? s[j...i]
      dp[i] = dp[j]
    end
  end
  dp[s.size]
end

p word_break('leetcode', ['leet', 'code'])
p word_break('applepenapple', ['apple', 'pen'])
