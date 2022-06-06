# Q-28: KMP string pattern matching
# @note:
#   1. prefix array: the longest size of prefix and suffix, where str-prefix == str-suffix
#   2. prefix computing start from at least one prefix;
#   3. use condition WHILE for checking until matched or return to start point(suffix_length = 0);
#   4. Check example: text = "aabaabaaf", pattern = 'aabaaf' => prefix = [0,1,0,1,2,0], returns 3(matched index)
def compute_prefix(pattern)
  prefix, suffix_tail = [0], 0
  (1...pattern.length).each do |prefix_tail|
    suffix_tail = prefix[suffix_tail - 1] while suffix_tail > 0 && pattern[suffix_tail] != pattern[prefix_tail]
    suffix_tail += 1 if pattern[suffix_tail] == pattern[prefix_tail]
    prefix[prefix_tail] = suffix_tail
  end
  prefix
end

def str_str(haystack, needle)
  prefix, matched = compute_prefix(needle), 0
  haystack.size.times do |i|
    matched = prefix[matched - 1] while matched > 0 && needle[matched] != haystack[i]
    matched += 1 if needle[matched] == haystack[i]
    return i - needle.length + 1 if matched == needle.size
  end
  -1
end


def str_str_one_liner(haystack, needle)
  haystack.index(needle) || -1
end
