def is_happy(n)
  a=n.to_s
  a=a.to_s
  k=0
  while true
    ss=a.to_s
    d=0
    ss.length.times do |i|
      di=ss[i].to_i
      d+=di**2
    end
    a=d
    return true if d==1
    k+=1
    return false if k>100
  end


end
