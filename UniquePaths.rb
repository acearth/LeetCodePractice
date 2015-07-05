# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  t=m+n-2
  a=0
  b=0
  if m>n
    a=m-1
    b=n-1
  else
    a=n-1
    b=m-1
  end
  base=1
  pro=1
  for i in 1..b
    base*=i
  end
  for i in t-b+1..t
    pro*=i
  end
  return pro/base
end
p unique_paths(7,3)
p unique_paths(3,3)
