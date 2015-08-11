def count_primes(n)
  return 0 if n<2
  arr=Array.new(n,1)
  2.upto(n) do |i|
    j=i*i
    break if j>=n
    while j<n
      arr[j]=0
      j+=i
    end
  end
  arr.inject(:+)-2
end
