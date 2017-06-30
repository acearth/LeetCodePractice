# s contains number, +, -, (), without * and /
def calculate(s)
  stack = []
  s.scan(/\w+|\+|\-|\(|\)/).each do |token|
    if token == '(' || token == '+' || token == '-'
      stack << token.to_sym
    else
      (token = stack.pop) && stack.pop if token == ')'
      next stack << token.to_i unless stack.last == :+ || stack.last == :-
      operator = stack.pop
      stack[-1] = [stack[-1], token.to_i].inject(operator)
    end
  end
  stack.first
end
