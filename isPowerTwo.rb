def is_power_of_two(n)
  if n<1
    return false
  end
 s= n.to_s(2)
 p s
 s=s.to_s
 cnt=0
 s.length.times do|i|
   if s[i]=='1'
     cnt+=1
   end
 end
 if cnt==1
   return true
 end
 return false
end


p is_power_two(2)
p is_power_two(-16)
  
p is_power_two(3)

