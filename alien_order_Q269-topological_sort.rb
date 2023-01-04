# Q-269: topological sort
# created at: 22/nov/2022
# @param {String[]} words
# @return {String}
def alien_order(words)
  order = Hash.new { |h, k| h[k] = [] }
  words.size.times do |i|
    (i + 1...words.size).each do |j|
      first, second = compare(words[i], words[j])
      return "" if !first || order[second].include?(first)
      order[first] << second if first != second
    end
  end
  degrees = {}
  words.join.chars.each { |ch| degrees[ch] = 0 }
  order.keys.each do |from|
    degrees[from] = 0 if !degrees.has_key?(from)
    order[from].each { |to| degrees[to] += 1 }
  end
  result = []
  while degrees.any?
    head, _ = degrees.find { |_, degree| degree == 0 }
    return "" unless head
    degrees.delete(head)
    result << head
    order[head].each { |v| degrees[v] -= 1 }
  end
  result.join
end

def compare(word1, word2)
  len = [word1.size, word2.size].min
  len.times { |i| return [word1[i], word2[i]] if word1[i] != word2[i] }
  return [] if word1.size > word2.size # handle illegal case: "abc" > "ab"
  return ['', ''] if word1.size == word2.size
  ['', word2[len]] # when word2 longer than word1
end

p alien_order(["wrt", "wrf", "er", "ett", "rftt"]) == 'wertf'
p alien_order(["ba", "b"]) == ''
p alien_order(["ba", "a"]) == 'ba'
p alien_order(["abcd", "abc"]) == ''
p alien_order(["ab", "abc"]) == 'abc'
p alien_order(["z", "z"]) == 'z'



