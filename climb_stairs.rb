def climb_stairs(n)
a=Array.new
a[0]=0
a[1]=1
a[2]=2
for i in 3..10000 
  a[i]=a[i-1]+a[i-2]
end
  if n<10000
    return a[n]
  else  
    return -1
  end
end

p climb_stairs(3)
p climb_stairs(8)
p climb_stairs(5)

