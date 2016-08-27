# cache node
class Node
  def initialize(k, v)
    @key = k
    @val = v
    @next = @pre = nil
  end

  attr_accessor :key, :val, :next, :pre
end

# LRU cache implemented by hash and double circular linked list, named as snake (who bites his tail)
class LRUCache
  def initialize(capacity)
    @snake = p = Node.new(-1, -1)
    capacity.times do
      p.next = Node.new(-1, -1)
      p.next.pre = p
      p = p.next
    end
    p.pre.next = @snake
    @snake.pre = p.pre
    @have = {}
  end

  def get(key)
    return -1 unless @have[key]
    touch(@have[key]) && @have[key].val
  end

  def set(key, value)
    if @have[key]
      @have[key].val = value
    else # substitute tail's key and value
      @have.delete(@snake.pre.key)
      @snake.pre.key = key
      @snake.pre.val = value
      @have[key] = @snake.pre
    end
    touch(@have[key])
  end

  private

  def touch(node)
    return true if node == @snake # on head or capacity == 1
    return @snake = @snake.pre if node == @snake.pre # tail
    node.pre.next = node.next
    node.next.pre = node.pre
    node.pre = @snake.pre
    node.next = @snake
    @snake.pre.next = node
    @snake.pre = node
    @snake = node
  end
end
