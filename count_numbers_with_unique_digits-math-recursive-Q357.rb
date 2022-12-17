# Q-357: recursive
# 18/dec/2022
# @param {Integer} n
# @return {Integer}
def count_numbers_with_unique_digits(n)
  check(n, { 0 => 1 })
end

def check(n, has)
  return has[n] if has[n]
  digits = (n - 1).times.map { |i| 9 - i }
  p digits
  has[n] = digits.reduce(1) { |prod, i| prod * i } * 9 + check(n - 1, has)
end
