# Q-155: min stack: EASY
# thinking about how to update min value is enough
class MinStack
  def initialize()
    @stack = []
    @mins = []
  end

  def push(val)
    @stack << val
    @mins << val if @mins.empty? || @mins.any? && @mins.last >= val
  end

  def pop()
    v = @stack.pop
    @mins.pop if @mins.last == v
  end

  def top()
    @stack.last
  end

  def get_min()
    @mins.last
  end
end