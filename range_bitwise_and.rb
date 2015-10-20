def range_bitwise_and(m,n)
  range=n-m
  mask,k = -1, 1
  (mask=mask<<1; k=k<<1) while k<range
  n & m & mask
end
