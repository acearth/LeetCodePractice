# question-402
def remove_kdigits(num, k)
  integers = num.chars.map(&:to_i)
  stack = []
  integers.each do |cur|
    # create one stack to keep accepted digits
    # remove larger digits than current digit
    while k > 0 && stack.any? && stack.last > cur
      stack.pop
      k -= 1
    end
    stack << cur
  end
  k.times { stack.pop } # tail is larger than head, then remove it when we have to
  stack.join.to_i.to_s # remove leading zeroes
end
