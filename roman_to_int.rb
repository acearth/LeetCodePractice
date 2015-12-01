VALUE=[['I', 1], ['V', 5], ['X', 10], ['L', 50],
       ['C', 100], ['D', 500], ['M', 1000]].to_h
def roman_to_int(str)
  return 0 if str==""
  %w[M D C L X V I].each do |ch|
    next if !str.include? ch
    ci = str.index(ch)
    return VALUE[ch] + roman_to_int(str[ci+1..-1]) - roman_to_int(str[0...ci])
  end
end
