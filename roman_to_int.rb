# Q-13:  Roman: Only one digits can be less than the principal and at most three less ones.
def roman_to_int(s)
  value = { I: 1, V: 5, X: 10, L: 50, C: 100, D: 500, M: 1000 }
  result = 0
  i = 0
  while i < s.size
    if i + 1 < s.size && value[s[i].to_sym] < value[s[i + 1].to_sym]
      result += value[s[i + 1].to_sym] - value[s[i].to_sym]
      i += 2
    else
      result += value[s[i].to_sym]
      i += 1
    end
  end
  result
end