def multiply(num1, num2)
  (get_int(num1.chars.map { |i| i.ord - 48 }) * get_int(num2.chars.map { |i| i.ord - 48 })).to_s
end

def get_int(digits)
  result = 0
  digits.each do |d|
    result *= 10
    result += d
  end
  result
end
