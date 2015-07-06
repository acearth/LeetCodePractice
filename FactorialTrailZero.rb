def trailing_zeroes(n)
  zcnt=0
  i=5
  while true
    mcnt=n/i
    if mcnt==0
      break
    else
      zcnt+=mcnt
      i*=5
    end
  end
  return zcnt
end


p trailing_zeroes(2)
p trailing_zeroes(5)
p trailing_zeroes(10)
p trailing_zeroes(50)

