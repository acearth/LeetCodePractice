# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
def divide(divident, divisor)
  result=divideAct(divident, divisor)
  return -2147483648 if result<-2147483648
  return 2147483647 if result>2147483647
  return result
end

def divideAct(dividend, divisor)
  raise RuntimeError if divisor==0
  return divideAct(-dividend, -divisor) if divisor<0&&dividend<0
  return -1*divideAct(-dividend, divisor) if dividend<0&&divisor>0
  return -1*divideAct(dividend, -divisor) if dividend>0&&divisor<0
  return 0 if dividend<divisor
  kd=dividend
  kr=0
  d=0
  while true
    break if kr+kr>kd
    kr+=kr
    d+=d
    kr=divisor if kr==0
    d=1 if d==0
  end
  return d if kd-kr<divisor
  return d+divideAct(kd-kr, divisor)
end
