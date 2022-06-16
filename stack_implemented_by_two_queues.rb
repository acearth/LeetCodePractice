class MyStack
  def initialize()
    @q, @top = [], nil
  end

  def push(x)
    @q << x
    @top = x
  end

  # @note: we cannot use last method of enumerable according to question constraints.
  def pop()
    aux = []
    (aux << @top = @q.shift) while @q.size > 1
    got = @q.shift
    @q = aux
    got
  end

  def top()
    @top
  end

  def empty()
    @q.empty?
  end
end