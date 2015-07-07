class Queue
  # Initialize your data structure here.
  attr_accessor :stack

  def initialize
    @stack=Array.new

  end

  # @param {Integer} x
  # @return {void}
  def push(x)
    stack.push(x)
    return
  end

  # @return {void}
  def pop
    a=stack.shift
    return
  end

  # @return {Integer}
  def peek
    return stack.first

  end

  # @return {Boolean}
  def empty
    if stack.size>0
      return false
    end
    return true
  end
end

