def jose(n)
 s=n.to_s(2)[1..-1]
 return 1+2*Integer("0B"+s)
end

p jose(8)
p jose(15)
