# Q-738: monotone_increasing_digits.rb FINE
def monotone_increasing_digits(n)
  digits = n.to_s.chars.map(&:to_i)
  incre_seq = 0
  (1...digits.size).each do |i|
    break if digits[incre_seq] > digits[i]
    incre_seq = i
  end
  return n if incre_seq + 1 == digits.size
  (incre_seq+1...digits.size).each { |i| digits[i] = 9 }
  (incre_seq).downto(0) do |i|
    digits[i + 1] = 9
    digits[i] -= 1
    break if i > 0 && digits[i] >= digits[i - 1]
  end
  digits.join.to_i
end
