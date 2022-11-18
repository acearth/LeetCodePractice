# Q-367: get square root : sqrt (similar to another q less than # 300)
# @param {Integer} num
# @return {Boolean}
def is_perfect_square(num)
  i = 1
  k = 1.0
  while i * k >= 1
    augment = (i * k).to_i
    while i * i <= num
      i += augment
    end
    i -= augment
    k /= 2
  end
  i * i == num
end

# p is_perfect_square(9)
# 17.times.each { |i| p is_perfect_square(i) }
