def hamming_weight(n)
  return 1+hamming_weight(2**31+n) if n<0
  result=0
  while n>0
    result+=n%2
    n=n>>1
  end
  result
end

p hamming_weight(3)
p hamming_weight(4)
p hamming_weight(6)
