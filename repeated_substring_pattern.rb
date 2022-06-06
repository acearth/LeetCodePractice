# Q-459: check if string == (some_sub_string repeated for some times)
# By KMP prefix checking
def repeated_substring_pattern(s)
  repeated_length = prefix(s).last
  # NOTE: boundary: must check tail prefix is zero or not
  repeated_length > 0 && s.size % (s.size - repeated_length) == 0
end

def prefix(str)
  prefix, suffix_tail = [0], 0
  (1...str.size).each do |prefix_tail|
    suffix_tail = prefix[suffix_tail - 1] while suffix_tail > 0 && str[suffix_tail] != str[prefix_tail]
    suffix_tail += 1 if str[suffix_tail] == str[prefix_tail]
    prefix[prefix_tail] = suffix_tail
  end
  prefix
end