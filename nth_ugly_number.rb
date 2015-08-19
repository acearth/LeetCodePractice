def nth_ugly_number(n)
  ug=[1]*n
  l2,l3,l5=1,1,1
  i2=i3=i5=0
  n.times do |i|
    m=[l2,l3,l5].min
    ug[i+1]=m
    (i2+=1;l2=ug[i2]*2) if m==l2
    (i3+=1;l3=ug[i3]*3) if m==l3
    (i5+=1;l5=ug[i5]*5) if m==l5
  end
  ug[-1]
end

p nth_ugly_number(3)
p nth_ugly_number(4)
p nth_ugly_number(5)
p nth_ugly_number(8)



