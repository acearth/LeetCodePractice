# Q-140: DP solution and backtracking
# 1/jan/2023
#
def word_break(s, word_dict)
  dp = [[]] * (1 + s.size)
  s.size.times do |i|
    word_dict.each do |word|
      start = i + 1 - word.size
      next unless start >= 0 && dp[start] && s[start...start + word.size] == word
      dp[i + 1] += start == 0 ? [word] : dp[start].map { |series| series + ' ' + word }
    end
  end
  dp.last
end

def word_break(s, word_dict)
  require 'set'
  backtrack([], 0, s, Set.new + word_dict, result = [])
  result
end

def backtrack(path, start, s, dict, result)
  return result << path.join(" ") if start == s.size
  (start...s.size).each do |tail|
    word = s[start..tail]
    next unless dict.include?(word)
    backtrack(path + [word], tail + 1, s, dict, result)
  end
end
