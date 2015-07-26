def range_bitwise_and(m,n)
  return 0 if m==0
  pre=m&n
  return pre if m==n
  b=(n-m).to_s(2)
  kStr='1'
  b.length.times { kStr+='0'}
  k=kStr.to_i(2)
  c=2**31-k
  pre&=c
end

