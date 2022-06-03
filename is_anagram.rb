# O(n*n) solution of sorting
def is_anagram_nn(s, t)
  s.chars.sort == t.chars.sort
end

#O(n) solution of hash-like way
def is_anagram(s, t)
  return false unless s.size == t.size
  sa, ta = [0] * 26, [0] * 26
  s.size.times do |i|
    sa[s[i].ord - 'a'.ord] += 1
    ta[t[i].ord - 'a'.ord] += 1
  end
  sa == ta
end
