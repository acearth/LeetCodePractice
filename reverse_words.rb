def reverse_words(str)
  str.split.reverse.join(" ")
end

def reverse_words_in_place(str)
  z = 0
  str.size.times do |i|
    if str[i] != ' ' || (i > 0 && str[i - 1] != ' ')
      str[z] = str[i]
      z += 1
    end
  end
  z -= 1 if str[z - 1] == ' ' # remove possible trailing ONE zero
  str = str[...z]
  reverse(str, 0, str.size - 1)
  cur = 0
  while cur < z
    start = cur
    cur += 1 while str[cur] && str[cur] != ' '
    reverse(str, start, cur - 1)
    cur += 1
  end
  str
end

def reverse(str, start, tail)
  while start < tail
    str[start], str[tail] = str[tail], str[start]
    start, tail = start + 1, tail - 1
  end
end