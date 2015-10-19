def my_pow(x,n)
  return 1 if n==0
  return 1.0/my_pow(x,-1*n) if n<0
  half=my_pow(x,n>>1)
  half*half * (n&1 == 0 ? 1 : x)
end
