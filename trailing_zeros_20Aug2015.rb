def trailing_zeroes(n)
  zeroCount=0
  base=5
  while base<=n
    zeroCount+=n/base
    base*=5
  end
  zeroCount
end


p trailing_zeroes(2)
p trailing_zeroes(5)
p trailing_zeroes(10)
p trailing_zeroes(50)

