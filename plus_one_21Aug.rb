def plus_one(digits)
  carry=0
  digits[-1]+=1
  (digits.size-1).downto(1) do |i|
    return digits if digits[i]<10
    digits[i]=0
    digits[i-1]+=1
  end
  return [1,0]+digits[1..-1] if digits[0]==10
  digits
end
