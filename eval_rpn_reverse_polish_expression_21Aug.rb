def eval_rpn(tokens)
  result=Array.new
  tokens.each do |token|
    var = (/^[+|\-|\*|\/]$/ =~ token) ? operate(token, result.pop, result.pop) : token.to_i
    result<<var
  end
  result[0]
end

def operate(op, d1, d2) ## notice the order
  return d2*d1 if op=='*'
  return d2+d1 if op=='+'
  return d2-d1 if op=='-'
  result=d2/d1
  result+=1 if result<0 && d2%d1!=0
  result
end
