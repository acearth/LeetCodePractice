def process(state, str)
  return state if str.empty?
  current, remain = str[0], str[1..-1]
  case state
  when 0
    return process(1, remain) if /[+-]/ =~ current
    return process(2, remain) if /\./ =~ current
    return process(4, remain) if /\d/ =~ current
  when 1
    return process(2, remain) if /\./ =~ current
    return process(4, remain) if /\d/ =~ current
  when 2
    return process(3, remain) if /\d/ =~ current
  when 3
    return process(3, remain) if /\d/ =~ current
    return process(7, remain) if /e/ =~ current
  when 4
    return process(4, remain) if /\d/ =~ current
    return process(5, remain) if /\./ =~ current
    return process(7, remain) if /e/ =~ current
  when 5
    return process(6, remain) if /\d/ =~ current
    return process(7, remain) if /e/ =~ current
  when 6
    return process(6, remain) if /\d/ =~ current
    return process(7, remain) if /e/ =~ current
  when 7
    return process(8, remain) if /[+-]/ =~ current
    return process(9, remain) if /\d/ =~ current
  when 8
    return process(9, remain) if /\d/ =~ current
  when 9
    return process(9, remain) if /\d/ =~ current
  end
  false
end
def is_number(s)
  [3,4,5,6,9].include? process(0, s.strip)
end
p is_number(" 0.1  ")
p is_number("2e10")
p is_number("+.8")
p is_number(".8")
p is_number("46.e8")
p is_number(".2e81")
p is_number("abc")==false
p is_number("1 a")==false
