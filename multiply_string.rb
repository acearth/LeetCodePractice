def multiply(num1, num2)
  (integer_of(num1.chars.map { |i| i.ord - 48 }) * integer_of(num2.chars.map { |i| i.ord - 48 })).to_s
end

def integer_of(digits)
  result = 0
  digits.each do |d|
    result *= 10
    result += d
  end
  result
end
