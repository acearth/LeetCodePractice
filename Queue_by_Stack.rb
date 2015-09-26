class Queue
  def initialize; @cur,@helper=[],[] end
  def empty() @cur.size==0 end
  def push(x) @cur<<x end

  def pop
    @helper<<@cur.pop while @cur.size>0
    @helper.pop if @helper.size>0
    @cur<<@helper.pop while @helper.size>0
  end
  def peek
    @helper<<@cur.pop while @cur.size>0
    result=@helper.pop if @helper.size>0
    @helper<<result if result
    @cur<<@helper.pop while @helper.size>0
    result
  end
end
