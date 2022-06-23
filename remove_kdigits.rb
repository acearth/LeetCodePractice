# Q-402
def remove_kdigits(num, k)
  num = num.chars.map(&:to_i)
  stack = []
  num.each do |n|
    while stack.any? && stack.last > n && k > 0
      stack.pop
      k -= 1
    end
    stack << n
  end
  k.times { stack.pop } # don't forget!
  stack.join.to_i.to_s
end