def length_of_longest_substring(s)
  h=Hash.new
  sub=String.new
  maxLen=0
  s.size.times do |i|
    ch=s[i]
    if sub.include? ch
      maxLen=sub.length if maxLen<sub.length
      ki=sub.index(ch)
      sub=sub[ki+1..-1]
    end
    sub+=ch
  end

  maxLen=sub.length if sub.length>maxLen
  return maxLen
end

s="abcabcbb"
p length_of_longest_substring s
s="bbb"
p length_of_longest_substring s
s="b"
p length_of_longest_substring s
s="aab"
p length_of_longest_substring s

