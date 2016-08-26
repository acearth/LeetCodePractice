# inner node in cache
class Node
  def initialize(k, v)
    @key = k
    @val = v
    @next = @pre = nil
  end

  attr_accessor :key, :val, :next, :pre
end

# cache documentation here
class LRUCache
  def initialize(capacity)
    @have = {}
    @chain = Node.new(-1, -1)
    @head = @chain
    (capacity - 1).times do
      @head.next = Node.new(-1, -1)
      @head.next.pre = @head
      @head = @head.next
    end
    @head.next = nil
    @tail = @head
  end

  def get(key)
    return -1 unless @have[key]
    touch(@have[key])
    @have[key].val
  end

  def set(key, value)
    if @have[key]
      @have[key].val = value
    else # reserve node by substitute key and val
      @have.delete(@tail.key)
      @tail.key = key
      @tail.val = value
      @have[key] = @tail
    end
    touch(@have[key])
  end

  private

  def touch(node)
    return if node == @chain # on head or capacity == 1
    if node == @tail
      @tail = @tail.pre
      @tail.next = nil
    else
      node.pre.next = node.next
      node.next.pre = node.pre
    end
    node.pre = nil
    node.next = @chain
    @chain.pre = node
    @chain = node
  end
end
