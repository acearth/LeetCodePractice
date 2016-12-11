# one liner
def add_binary(a, b)
  (a.to_i(2) + b.to_i(2)).to_s(2)
end

def add_binary_bitwise(a, b)
  return a if b == '0'
  return add_binary(b, a) if a.length < b.length
  carry = 0
  ans = (1..b.length).to_a.map do |k|
    i, j = a[-k].to_i, b[-k].to_i
    cur = i ^ j ^ carry
    carry = (i + j + carry) >> 1
    cur
  end
  header = add_binary(carry.to_s, a[0...a.length - b.length])
  (header == '0' ? '' : header) + ans.reverse.join
end
