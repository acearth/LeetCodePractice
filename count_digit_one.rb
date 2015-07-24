def count_digit_one(n)
  checker=1
  count=0
  while checker<=n
    q=n/(checker*10)
    r=n%(checker*10)
    count+=q*checker
    if r>=checker*2
      count+=checker
    elsif r>=checker
      count+=r-checker+1
    end
    checker*=10
  end
  count
end
p count_digit_one 13
p count_digit_one 23

