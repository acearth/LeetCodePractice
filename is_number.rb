TRANSIT = [[[], [], [1], []], # 0
           [[8], [], [], [2]], # 1
           [[3], [], [], [2]], # 2
           [[], [], [], [3]], # 3
           [[], [5], [], [4]], # 4
           [[], [], [6], []], # 5
           [[], [], [], [7]], # 6
           [[], [], [], [7]], # 7
           [[], [], [], [4]]].freeze

def check(input, state)
  return [2, 3, 4, 7].include? state if input && input.empty? || !state
  case state
    when 0
      return true if check(input, 1)
    when 1
      return true if check(input, 8)
    when 2
      return true if check(input, 4)
    when 3
      return true if check(input, 4)
    when 5
      return true if check(input, 6)
  end
  next_state = TRANSIT[state][input.first]
  check(input[1..-1], next_state && next_state.first)
end

def is_number(str)
  inputs = str.strip.chars.map do |char|
    case char
      when '.' then
        0
      when 'e' then
        1
      when /[+-]/ then
        2
      when /\d/ then
        3
      else
        4
    end # unacceptable input
  end
  check(inputs, 0)
end

def is_number(s)
  s = s.gsub('e', 'E')
  if s.count('E') == 0
    return integer?(s) || decimal?(s)
  elsif s.count('E') == 1
    return false if s[0] == 'E' || s[-1] == 'E'
    parts = s.split('E')
    return false unless integer?(parts[1])
    integer?(parts[0]) || decimal?(parts[0])
  else
    false
  end
end

def integer?(s)
  s = s[1..-1] if s[0] == '+' || s[0] == '-'
  return false if s.include?('+') || s.include?('-')
  (s =~ /^(\d+)$/) == 0
end

def decimal?(s)
  s = s[1..-1] if s[0] == '-' || s[0] == '+'
  return false unless s.count('.') == 1
  parts = s.split('.')
  return false unless (parts[0] =~ /^(\d+)$/) == 0 if parts[0] != ''
  return false unless (parts[1] =~ /^(\d+)$/) == 0 if parts[1] && parts[1] != ''
  true
end

p is_number("005047e+6")
p is_number('+.8')
p is_number('0e') == false