def my_pow(x,n)
  return my_pow(1.0/x,-n) if n<0
  return 1 if n==0
  return x if n==1
  v=my_pow(x,n/2)
  v*v*my_pow(x,n%2)
end
