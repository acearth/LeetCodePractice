class MinStack
  attr_accessor :minVal, :diffStack
  def initialize
    @minVal=0
    @diffStack=Array.new

  end

  def push(x)
    if @diffStack.size<1
      @minVal=x
      @diffStack.push 0
    else
      t=x-@minVal
      @diffStack.push t
      @minVal=x if t<0
    end
    return
  end

  def pop
    t=@diffStack.pop
    @minVal-=t if t<0
  end

  def top
    return @minVal if @diffStack.last<0
    return @minVal+@diffStack.last
  end

  def get_min
    return @minVal
  end

end

m1=MinStack.new
m1.push(2147483646)
m1.push(2147483646)
m1.push(2147483647)
p m1.top
m1.pop
p m1.get_min
m1.pop
p m1.get_min
m1.pop
m1.push(2147483647)
p m1.top
p m1.get_min
m1.push(-2147483648)
p m1.top
p m1.get_min
m1.pop
p m1.get_min


