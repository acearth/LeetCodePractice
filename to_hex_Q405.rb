# Q-405: to hex number: bit ops
# updated 01/dec/2022
# NOTE: return 2**32 + num for negative result for complement representation
# @param {Integer} num
# @return {String}
def to_hex(num)
  return to_hex(2 ** 32 + num) if num < 0
  result = num == 0 ? [0] : []
  digit = Hash.new { |h, k| h[k] = k }.merge({ 10 => :a, 11 => :b, 12 => :c, 13 => :d, 14 => :e, 15 => :f })
  while num > 0
    result << digit[num % 16]
    num /= 16
  end
  result.join.reverse
end