class Stack
  # Initialize your data structure here.
  attr_accessor :queue
  def initialize
    @queue=Array.new
  end

  # @param {Integer} x
  # @return {void}
  def push(x)
    queue<<x
    return
  end

  # @return {void}
  def pop
    queue.pop
    return
  end

  # @return {Integer}
  def top
    return queue.last
  end

  # @return {Boolean}
  def empty
    return false if queue==nil
    return queue.size<1
  end
end
