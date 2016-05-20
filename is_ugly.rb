def is_ugly(num)
  num != 0 && [2, 3, 5].each { |f| num /= f while num % f == 0 } && num == 1
end
