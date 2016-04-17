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
