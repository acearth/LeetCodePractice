# Q-340: sliding window
# 17/dec/2022
# @param {String} s
# @param {Integer} k
# @return {Integer}
def length_of_longest_substring_k_distinct(s, k)
  has = Hash.new { |h, k| h[k] = 0 }
  len = 0
  left = 0
  s.chars.each_with_index do |ch, right|
    has[ch] += 1
    while has.size > k
      ct = s[left]
      left += 1
      has[ct] -= 1
      has.delete(ct) if has[ct] == 0
    end
    len = [right - left + 1, len].max
  end
  len
end
