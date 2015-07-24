def count_digit_one(n)
  checker=10
  count=0
  loop do
    q=n/checker
    r=n%checker
    count+=q*(checker/10)
    if r>=checker/5
      count+=checker/10
    elsif r>=checker/10
      count+=r-checker/10+1
    end
    checker*=10
    break if checker>n*10
  end
  count
end
p count_digit_one 13
p count_digit_one 23

