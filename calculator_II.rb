def calculate(s)
  stack, m_stack= [], []
  s.scan(/\w+|\+|\-|\*|\//) do |token|
    if token == '*' || token == '/'
      m_stack << stack.pop if m_stack.empty?
      m_stack << token.to_sym
    elsif token == '+' || token == '-'
      stack << m_stack.pop if m_stack.any?
      stack << token.to_sym
    elsif m_stack.any?
      op = m_stack.pop
      m_stack[-1] = [m_stack[-1], token.to_i].inject(op)
    else
      stack << token.to_i
    end
  end
  stack << m_stack.pop if m_stack.any?
  compute(stack)
end

def compute(stack)
  result, op = 0, :+
  stack.each {|token| (token == :+ || token == :-) ? op = token : result = [result, token].inject(op)}
  result
end


# Q-227: two phase solution
# 24/dec/2022
def calculate(s)
  stack = []
  op = nil
  s.scan(/\w+|\+|-|\*|\//).each do |t|
    if t =~ /\d/
      if op == '*' || op == '/'
        op = stack.pop
        stack << [stack.pop, t.to_i].inject(op.to_sym)
      else
        stack << t.to_i
      end
    else
      stack << t
      op = t
    end
  end
  result = 0
  op = "+"
  stack.each do |t|
    if t == '+' || t == '-'
      op = t
    else
      result = [result, t].inject(op.to_sym)
    end
  end
  result
end