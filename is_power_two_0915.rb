def is_power_of_two(n)
  n>0 && (n&(n-1))==0
end
def is_power_of_two_deprecated(n)
  return n==1 if n<1
  n.to_s(2).chars[1..-1].each{|ch| return false if ch=='1'}
  true
end
