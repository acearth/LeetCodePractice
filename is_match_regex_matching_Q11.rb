def is_match(s,p)
  return s.size==0 if p.size==0
  return  s==p ||s.size==1&&p=='.' if p.size==1
  if p[2]=='*'
      return is_match(s[1..-1],p) ||is_match(s[1..-1],p[2..-1]) if is_match(s[0],p[0])
      return is_match(s,p[2..-1])
  else
    return is_match(s[0],p[0]) ? is_match(s[1..-1],p[1..-1]) : false
  end
end
p is_match('aa','a')==false
p is_match('aa','aa')
p is_match('aa','a*')
p is_match('aa','.*')
p is_match('ab','.*')
p is_match('aab','c*a*b*')

