## TLE
def is_match(s,p)
  if p.size==0
    return s.size==0
  elsif p.size==1
    return true if p=='*' || p=='?' && s.size==1 || p==s
    return false
  else
    return false if s.size==0
    return is_match(s[1..-1],p[1..-1]) if p[0]=='?' || p[0]==s[0]
    if p[0]=='*'
      s.size.times {|i| return true if is_match(s[i..-1],p[1..-1]) }
    end
  end
end
p is_match('aa','aa')
p is_match('aa','a?')
p is_match('aa','ab')
p is_match('aa','*')

