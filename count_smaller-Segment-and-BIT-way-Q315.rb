# Q-315: segment tree and bit-tree way
# 3/dec/2022
# @param {Integer[]} nums
# @return {Integer[]}
# Q-315: segment tree way
def count_smaller(nums)
  offset = 10000
  size = 1 + offset * 2
  seg = [0] * size * 2
  result = []
  (nums.size - 1).downto(0) do |i|
    smaller = query(nums[i] + offset, seg, size)
    result << smaller
    update(nums[i] + offset, seg, size)
  end
  result.reverse
end

def update(i, seg, size)
  i += size
  seg[i] += 1
  while i > 1
    i /= 2
    seg[i] = seg[i * 2] + seg[i * 2 + 1]
  end
end

def query(r, seg, size)
  l, r, result = size, size + r, 0
  while l < r
    (result += seg[l]; l += 1) if l.odd?
    (r -= 1; result += seg[r]) if r.odd?
    l, r = l / 2, r / 2
  end
  result
end

# Q-315: bit way
def count_smaller(nums)
  offset = 10000
  size = 2 * offset + 2
  bit = [0] * size
  result = []
  (nums.size - 1).downto(0) do |i|
    smaller = query(nums[i] + offset, bit)
    result << smaller
    update(nums[i] + offset + 1, bit, size)
  end
  result.reverse
end

def update(i, bit, size)
  while i < size
    bit[i] += 1
    i += i & -i
  end
end

def query(i, bit)
  result = 0
  while i > 0
    result += bit[i]
    i -= i & -i
  end
  result
end

p count_smaller([5, 2, 6, 1]) == [2, 1, 1, 0]
p count_smaller([-1, -1]) == [0, 0]
p count_smaller([-1, -1])

