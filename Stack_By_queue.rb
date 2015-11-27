class Stack
  def initialize
    @que, @last = [],nil
  end

  def push(x)
    @que << @last if @last!=nil
    @last = x
  end

  def pop
    return if @last==nil
    tmp = []
    tmp<< @que.shift while @que.size > 1
    @last = @que.shift
    @que = tmp
  end

  def top
    @last
  end

  def empty
    @last==nil
  end
end
