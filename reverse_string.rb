# Q-344: inplace reverse
def reverse_string(s)
  p, q = 0, s.size - 1
  while p < q
    s[p], s[q] = s[q], s[p]
    p, q = p + 1, q - 1
  end
end