def reverse(x)
  num=x.to_i
  flag=1
  if(x.to_i<0)
    flag=-1
  end
  s=num.to_s
  len=s.length
  t=String.new(s)
  len.times do|i|
    t[len-i-1]=s[i]
  end
  value=t.to_i*flag
  if value>2**31-1
    value=0
  end
  if(value<(-1)*2**31)
    value=0
  end
  return value
end

p reverse(0)
p reverse(-2)
p reverse(-22)
p reverse(123)

