# q-541
def reverse_str(s, k)
  p = 0
  while s[p]
    q = p + k > s.size ? s.size - 1 : p + k - 1
    next_p = p + k * 2
    while p < q
      s[p], s[q] = s[q], s[p]
      p, q = p + 1, q - 1
    end
    p = next_p
  end
  s
end
