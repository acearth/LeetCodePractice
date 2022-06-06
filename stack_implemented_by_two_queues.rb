# Q-225: stack implemented by queues
# NOTE: @out queue is ancillary
class MyStack
  def initialize()
    @in, @out = [], []
  end

  def push(x)
    @in << x
  end

  def pop()
    @in, @out = @out, @in if @in.empty?
    @out << @in.shift while @in.size > 1
    @in.shift
  end

  def top()
    @in.last || @out.last
  end

  def empty()
    @in.empty? && @out.empty?
  end
end