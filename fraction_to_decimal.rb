# Q-166: pigeonhole principle
def fraction_to_decimal(numerator, denominator)
  if numerator > 0 && denominator < 0 || numerator < 0 && denominator > 0
    return '-' + fraction_to_decimal(numerator.abs, denominator.abs)
  end
  numerator = numerator.abs
  denominator = denominator.abs
  ints = numerator / denominator
  numerator %= denominator
  return ints.to_s if numerator == 0
  quotations, seen = [], Hash.new { |h, k| h[k] = {} }
  while numerator != 0
    numerator *= 10
    q = numerator / denominator
    if seen[numerator][denominator]
      len = quotations.size - seen[numerator][denominator]
      get_loop(quotations, len)
      return "#{ints}.#{quotations[0...quotations.size - len].join}(#{quotations[quotations.size - len..-1].join})"
    end
    quotations << q
    seen[numerator][denominator] = quotations.size - 1
    numerator %= denominator
  end
  "#{ints}.#{quotations.join}"
end

def get_loop(keys, len)
  len.times do
    break if keys.last != (keys.size - 1 - len >= 0 && keys[keys.size - 1 - len])
    keys.pop
  end
end

p fraction_to_decimal(-50, 8) == '-6.25'
p fraction_to_decimal(1, 17) == "0.(0588235294117647)"
p fraction_to_decimal(4, 333) == '0.(012)'
p fraction_to_decimal(1, 6) == '0.1(6)'
p fraction_to_decimal(1, 333) == '0.(003)'
# p get_loop([0, 0, 2, 0, 0], 3) == [0, 0, 2]
