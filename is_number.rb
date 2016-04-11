def is_number(str, state = 0)
  return [2, 3, 4, 7].include? state if str && str.empty? || !state
  case state
  when 0
    str.strip! # remove white space before take action
    return true if is_number(str, 1)
  when 1
    return true if is_number(str, 8)
  when 2
    return true if is_number(str, 4)
  when 3
    return true if is_number(str, 4)
  when 5
    return true if is_number(str, 6)
  end
  next_state = TRANSIT[state][type(str[0])]
  is_number(str[1..-1], next_state && next_state.first)
end

TRANSIT = [[[], [], [1], []], # 0
           [[8], [], [], [2]], # 1
           [[3], [], [], [2]], # 2
           [[], [], [], [3]], # 3
           [[], [5], [], [4]], # 4
           [[], [], [6], []], # 5
           [[], [], [], [7]], # 6
           [[], [], [], [7]], # 7
           [[], [], [], [4]]].freeze

def type(char)
  case char
  when '.' then 0
  when 'e' then 1
  when /[+-]/ then 2
  when /\d/ then 3
  else 4 end # unacceptable input
end

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
def is_number_dfa(s)
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
