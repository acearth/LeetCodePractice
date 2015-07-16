class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end

  def to_s
    return "#{@val}"
  end

  def tranverse
    p @val
    if self.next!=nil
      self.next.tranverse
    end
  end

end


