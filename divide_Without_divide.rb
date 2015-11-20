def divide(divident, divisor)
  res=go_divide(~divident+1, ~divisor+1) if divident<0 && divisor < 0
  res=(~go_divide(divident, ~divisor+1)) + 1 if divident>=0 && divisor<0
  res=(~go_divide(~divident+1, divisor)) + 1 if divident<0 && divisor>0
  res=go_divide(divident, divisor) if divident>=0 && divisor>0
  (-2147483648..2147483647).include?(res) ? res : 2147483647
end

def go_divide(divident, divisor)
  return 0 if divident < divisor
  return divident if divisor==1
  res, cur=1, divisor
  while cur+cur < divident
    res=res<<1
    cur=cur<<1
  end
  res + divide(divident - cur, divisor)
end
