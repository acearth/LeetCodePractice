def hamming_weight(n)
  count=0
  while n!=0
    n=n&(n-1)
    count+=1
  end
  count
end
