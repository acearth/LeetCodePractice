class MinStack
  def initialize
    @diff_stack = []
  end

  def push(x)
    @min = x if @diff_stack.empty?
    @diff_stack << x - @min
    @min = x if @diff_stack.last < 0
  end

  def pop
    v = @diff_stack.pop
    @min -= v if v && v < 0
  end

  def top
    return if @diff_stack.empty?
    @diff_stack.last < 0 ? @min : @min + @diff_stack.last
  end

  def get_min
    return if @diff_stack.empty?
    @diff_stack.last < 0 ? top : @min
  end
end
