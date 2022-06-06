# Q-150: RPN solution with stack
# NOTE: ruby math is round down, so -6/132 = -1, rather than 0
#       Need to use float-ize or '%' complement it.
def eval_rpn(tokens)
  result = Array.new
  tokens.each do |token|
    var = (/^[+\-\*\/]$/ =~ token) ? operate(token, result.pop, result.pop) : token.to_i
    result << var
  end
  result[0]
end

def operate(op, d1, d2)
  ## notice the order
  return d2 * d1 if op == '*'
  return d2 + d1 if op == '+'
  return d2 - d1 if op == '-'
  result = d2 / d1
  result += 1 if result < 0 && d2 % d1 != 0
  result
end

# Solution with inject on 6/june/2022
def eval_rpn_with_inject(tokens)
  tokens.map! { |t| /\d/ =~ t ? t.to_i : t.to_sym }
  stack = []
  tokens.each do |curr|
    if curr.is_a? Integer
      stack << curr
    else
      right = stack.pop * 1.0
      stack << [stack.pop, right].inject(curr).to_i
    end
  end
  stack.last
end