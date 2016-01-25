def climb_stairs(n)
  return n if n<=2
  f1,f2=1,2
  (n-2).times{
    f2=f2+f1
    f1=f2-f1
  }
  f2
end


