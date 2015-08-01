def is_anagram(s, t)
  a,b=[],[]
  s.split('').each {|ch| a<<ch}
  t.split('').each {|ch| b<<ch}
  a.sort!
  b.sort!
  a==b
end
