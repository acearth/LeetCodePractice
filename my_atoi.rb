# Q-8: my atoi: parse topic
# 27/dec/2022
# @param {String} s
# @return {Integer}
def my_atoi(s)
  i = 0
  i += 1 while s[i] == ' '
  sign = 1
  if s[i] == '+' || s[i] == '-'
    sign = -1 if s[i] == '-'
    i += 1
  end
  result = 0
  while i < s.size && s[i].ord >= '0'.ord && s[i].ord <= '9'.ord
    result *= 10
    result += s[i].ord - '0'.ord
    i += 1
  end
  result *= sign
  if result < -1 * 2 ** 31
    result = -1 * 2 ** 31
  elsif result > 2 ** 31 - 1
    result = 2 ** 31 - 1
  end
  result
end