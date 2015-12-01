def roman_to_int(str)
  return 0 if str==""
  %w[M D C L X V I].each do |ch|
    next if !str.include? ch
    ci = str.index(ch)
    return roman_to_int(str[ci+1..-1]) - roman_to_int(str[0...ci]) +
      case str[ci]
    when 'M' then 1000
    when 'D' then 500
    when 'C' then 100
    when 'L' then 50
    when 'X' then 10
    when 'V' then 5
    else 1
    end
  end
end
