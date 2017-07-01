def calculate(s)
  stack, m_stack= [], []
  s.scan(/\w+|\+|\-|\*|\//) do |token|
    if token == '*' || token == '/'
      m_stack << stack.pop if m_stack.empty?
      m_stack << token.to_sym
    elsif token == '+' || token == '-'
      stack << m_stack.pop if m_stack.any?
      stack << token.to_sym
    else
      if m_stack.any?
        op = m_stack.pop
        m_stack[-1] = [m_stack[-1], token.to_i].inject(op)
      else
        stack << token.to_i
      end
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
