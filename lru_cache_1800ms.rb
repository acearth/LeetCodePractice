# Inner class
class CacheNode
  attr_accessor :key, :value, :next, :pre

  def initialize(key, value)
    @key = key
    @value = value
  end
end

require 'set'

# Solution
class LRUCache
  def initialize(capacity)
    q = Array.new(capacity) { CacheNode.new(-1, -1) }
    0.upto(capacity - 1) do |i|
      q[i].next = q[i + 1]
      q[i].pre = q[i - 1]
    end
    @queue = q[0]
    @tail = q[-1]
    @keys = Set.new
  end

  def get(key)
    return -1 unless @keys.include? key
    return @queue.value if @queue.key == key
    p = @queue
    p = p.next while p.key != key
    p.next ? shift(p) : shift_tail
    @queue.value
  end

  def set(key, value)
    return @queue.value = value if get(key) != -1
    shift_tail
    (@keys << key).delete @queue.key
    @queue.key = key
    @queue.value = value
  end

  private

  def shift_tail
    return unless @tail.pre
    new_head = @tail
    @tail = @tail.pre
    @tail.next = nil
    new_head.next = @queue
    @queue.pre = new_head
    @queue = new_head
    new_head.pre = nil
  end

  def shift(p)
    p.next.pre = p.pre
    p.pre.next = p.next
    p.pre = nil
    p.next = @queue
    @queue.pre = p
    @queue = p
  end
end
