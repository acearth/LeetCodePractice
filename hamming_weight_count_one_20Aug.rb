def hamming_weight(n)
  return hamming_weight(~n)+1 if n<0
  count=0
  while n!=0
    n=n&(n-1)
    count+=1
  end
  count
end
