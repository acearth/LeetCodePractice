def reverse_k_group(head, k)
  dummy = ListNode.new(0, head)
  pre = tail = dummy
  while head
    last = head
    k.times do |i|
      last = head
      head = head.next
      return dummy.next if i != k - 1 && !head
    end
    last.next = nil
    reversed = reverse_list(pre.next)
    pre.next = reversed.first
    pre = reversed.last
    pre.next = head
  end
  dummy.next
end

def reverse_list(head)
  return [nil, nil] unless head
  cur = tail = head
  head = head.next
  cur.next = nil
  while head
    next_node = head.next
    head.next = cur
    cur = head
    head = next_node
  end
  [cur, tail]
end
