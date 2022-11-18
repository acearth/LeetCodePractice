# Q-405
# @param {Integer} num
# @return {String}
def to_hex(num)
  return "0" if num == 0
  key = Hash.new { |h, k| h[k] = k }
  (10...16).each { |i| key[i] = ('a'.ord + i - 10).chr }
  negative = num < 0
  num += 2 ** 31 if num < 0
  result = []
  while num > 0
    result << num % 16
    num = num >> 4
  end
  if negative
    result += [0] * (8 - result.size)
    result[-1] = (8 + result[-1]) % 16 if negative
  end
  result.map { |i| key[i] }.reverse.join
end