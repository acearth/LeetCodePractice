# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  ar=Array.new
  len=tokens.length
  for tok in tokens
    if isOperator tok
      ar.push(getResult(tok, ar.pop, ar.pop))
    else
      ar.push tok.to_i
    end
  end
  return ar.first
end

def isOperator(ch)
  if ch=="*"||ch=="/"||ch=="+"||ch=="-"
    return true
  end
  return false
end

def getResult(op, d1, d2)
  if op=="*"
    return d1*d2
  elsif op=="/"
    re=d2/d1
    m=d2%d1
    re+=1 if re<0&&m!=0
    return re
  elsif op=="+"
    return d1+d2
  elsif op=="-"
    return d2-d1
  else
    raise "ERROR"
  end
end

ss=["2", "1", "+", "3", "*"]
p eval_rpn(ss)
ss= ["4", "13", "5", "/", "+"]
p eval_rpn(ss)
ss=["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
p eval_rpn(ss)
