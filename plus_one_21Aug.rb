def plus_one(digits)
  com=1  ##init to 1 and then execute
  (digits.size-1).downto(0) do |i|
    digits[i]+=com
    com=digits[i]/10
    break if com==0
    digits[i]=digits[i]-10
  end
  digits=[com]+digits if com==1
  digits
end

