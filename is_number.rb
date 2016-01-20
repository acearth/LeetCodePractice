def process(state, str)
  return state if str.empty?
  current, remain = str[0], str[1..-1]
  case state
  when 0
    return process(1, remain) if /[+-]/ =~ current
    return process(2, remain) if /0/ =~ current
    return process(3, remain) if /[1-9]/ =~ current
    return process(4, remain) if /\./ =~ current
  when 1
    return process(2, remain) if /0/ =~ current
    return process(3, remain) if /[1-9]/ =~ current
  when 2
    return process(4, remain) if /\./ =~ current
  when 3
    return process(3, remain) if /[0-9]/ =~ current
    return process(4, remain) if /\./ =~ current
    return process(6, remain) if /e/ =~ current
  when 4
    return process(5, remain) if /[0-9]/ =~ current
  when 5
    return process(5, remain) if /[0-9]/ =~ current
  when 6
    return process(7, remain) if /[+-]/ =~ current
    return process(8, remain) if /[0-9]/ =~ current
  when 7
    return process(8, remain) if /[0-9]/ =~ current
  when 8
    return process(8, remain) if /[0-9]/ =~ current
  end
  false
end

def is_number(s)
  state = process(0,s.strip)
  [2,3,5,8].include? state
end
