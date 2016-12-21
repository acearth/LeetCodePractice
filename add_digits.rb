def add_digits(num)
  num == 0 ? 0 : (num % 9 == 0 ? 9 : num % 9)
end
