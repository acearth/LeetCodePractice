def fizz_buzz(n)
    (1..n).to_a.map{|i| i % 15 == 0 ? "FizzBuzz" : i % 3 == 0 ? "Fizz" : i % 5 == 0 ? "Buzz" : i.to_s }    
end
