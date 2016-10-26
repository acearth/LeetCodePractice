class ListNode
  attr_accessor :val, :next

  class << self
    def generate(array)
      array.map! { |v| ListNode.new(v) }
      array.length.times { |i| array[i].next = array[i+1] }
      array.first
    end
  end

  def initialize(value)
    @val = value
    @next = nil
  end

  def to_s
    "#{@val}"
  end

  def traverse
    print @val
    print ' -> ' if self.next
    self.next.traverse if self.next
  end
end

# Usage lists below:
# list = ListNode.generate([1, 2, 3, 5, 4, 0])
# list.traverse

