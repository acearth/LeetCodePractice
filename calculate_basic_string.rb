# Q-224: calculator I: s contains number, +, -, (), without * and /
# 25/dec/2022
# (1) treat "A - X" and "-X" as "A + (-X)" and "0 + (-X)";
# (2) each bracket will always reduced to one number!
def calculate(s)
  result = 0
  stack = []
  op = 0
  sign = 1
  s.scan(/\w+|\+|\-|\(|\)/).each do |token|
    if token =~ /\d/
      op = token.to_i
    elsif token == '+' || token == '-'
      result += sign * op
      sign = token == '+' ? 1 : -1
      op = 0
    elsif token == '('
      stack << result
      stack << sign
      result = 0
      sign = 1
    else
      result += sign * op
      result *= stack.pop
      result += stack.pop
      op = 0
    end
  end
  result + op * sign
end