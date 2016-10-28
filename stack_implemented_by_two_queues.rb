class Stack
  def initialize
    @que = []
  end

  def push(x)
    @last && @que << @last
    @last = x
  end

  def pop
    alter = []
    alter << @que.shift while @que.size > 1
    @last = @que.shift
    @que = alter
  end

  def top
    @last
  end

  def empty
    !@last
  end
end
