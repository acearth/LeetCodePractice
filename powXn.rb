def my_pow(x,n)
  return my_pow(1.0/x,-n) if n<0
  return 1 if n==0
  return x if n==1
  v=my_pow(x,n/2)
  return v*v*x if n%2==1
  return v*v
end

p my_pow(2,3)
p my_pow(2,-3)
p my_pow 0.44894,-5
p my_pow 0.44894,5

