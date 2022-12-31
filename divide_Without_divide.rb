# Q-29: divide without divide
# 2015 -> 31/dec/2022
def divide(dividend, divisor)
  result = div(dividend.abs, divisor.abs)
  result = -result unless divisor > 0 && dividend >= 0 || divisor < 0 && dividend <= 0
  result > (2 ** 31 - 1) ? 2 ** 31 - 1 : result
end

def div(divdend, divisor)
  return 0 if divdend < divisor
  power = 1
  d = divisor
  while divdend >= d + d
    d += d
    power += power
  end
  power + div(divdend - d, divisor)
end