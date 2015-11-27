class Queue
  def initialize
    @in, @out = [],[]
  end

  def push x; @in<<x end

  def pop
    ( @out<< @in.pop while @in.size > 0 ) if @out.empty?
    @out.pop
  end

  def peek
    last = pop
    @out << last
    last
  end

  def empty
    @in.empty? && @out.empty?
  end
end
