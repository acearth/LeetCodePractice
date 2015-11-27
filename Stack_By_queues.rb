class Stack
  def initialize
    @que, @last = [],nil
  end

  def push(x)
    @que << @last if @last!=nil
    @last = x
  end

  def pop(alter=[]) # key parameter used
    alter<< @que.shift while @que.size > 1
    @last = @que.shift
    @que = alter
  end

  def top
    @last
  end

  def empty
    @last==nil
  end
end
