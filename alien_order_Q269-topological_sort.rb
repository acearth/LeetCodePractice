# Q-269: topological sort
#
# @param {String[]} words
# @return {String}
def alien_order(words)
  pre = Hash.new { |h, k| h[k] = [] }
  words.size.times do |i|
    (i + 1...words.size).each do |j|
      first, second = compare(words[i], words[j])
      return "" if !first || pre[second].include?(first)
      pre[first] << second if first != second
    end
  end
  degrees = {}
  words.join.chars.each { |ch| degrees[ch] = 0 }
  pre.keys.each do |k|
    degrees[k] = 0 if !degrees.has_key?(k)
    pre[k].each do |v|
      degrees[v] += 1
    end
  end
  result = []
  while degrees.any?
    cur, _ = degrees.find { |_, d| d == 0 }
    return "" if cur == nil
    degrees.delete(cur)
    result << cur
    pre[cur].each do |v|
      degrees[v] -= 1
    end
  end
  result.join
end

def compare(word1, word2)
  len = [word1.size, word2.size].min
  len.times do |i|
    return [word1[i], word2[i]] if word1[i] != word2[i]
  end
  return [] if word1.size > word2.size # abc > ab <-- illegal case
  word2[len] == nil ? [word1[-1], word1[-1]] : ['', word2[len]]
end

p alien_order(["wrt", "wrf", "er", "ett", "rftt"]) == 'wertf'
p alien_order(["ba", "b"]) == ''
p alien_order(["ba", "a"]) == 'ba'
p alien_order(["abcd", "abc"]) == ''
p alien_order(["ab", "abc"]) == 'abc'
p alien_order(["z", "z"]) == 'z'



