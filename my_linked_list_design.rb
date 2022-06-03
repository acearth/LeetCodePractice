# q-707: data design for linked list
# Cautious about init-condition and null pointer check!
class MyLinkedList
  def initialize()
    @store = ListNode.new(0)
  end

  def get(index)
    p = @store.next
    index.times do
      p = p.next
      break unless p
    end
    p ? p.val : -1
  end

  def add_at_head(val)
    remain = @store.next
    @store.next = ListNode.new(val, remain)
  end

  def add_at_tail(val)
    p = @store
    p = p.next while p && p.next
    p.next = ListNode.new(val)
  end

  def add_at_index(index, val)
    p = @store
    index.times { p = p.next }
    if p
      remain = p.next
      p.next = ListNode.new(val, remain)
    end
  end

  def delete_at_index(index)
    p = @store
    index.times { p = p.next; break unless p }
    p.next = p.next.next if p && p.next
  end
end

# Your MyLinkedList object will be instantiated and called as such:
# obj = MyLinkedList.new()
# param_1 = obj.get(index)
# obj.add_at_head(val)
# obj.add_at_tail(val)
# obj.add_at_index(index, val)
# obj.delete_at_index(index)