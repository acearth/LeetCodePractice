def generate(n)
  return n<1 ? [] : [[1]] if n<2
  res=generate(n-1)
  cur=[1]
  1.upto(res[-1].size-1) { |i| cur<<res[-1][i-1]+res[-1][i] }
  cur<<1
  res<<cur
end
