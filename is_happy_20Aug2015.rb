def is_happy(n)
  hash=Hash.new
  while hash[n].nil? 
    n=hash[n]=n.to_s.chars.inject(0){|m,c| m+c.to_i*c.to_i }
  end
  n==1
end
p is_happy(19)
p is_happy(18)
