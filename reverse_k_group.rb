def reverse_k_group(head, k)
  pre = dummy = ListNode.new(0, head)
  while head
    last = head
    k.times do
      return dummy.next unless head
      last = head
      head = head.next
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
  return [] unless head
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

def reverse_k_group_without_subroutine(head, k)
  pre = dummy = ListNode.new(0, head)
  while head
    #check remain elements more than k, otherwise return it
    q = head
    k.times do
      return dummy.next unless q
      q = q.next
    end
    # k-group reverse
    sub_head = tail = nil
    k.times do
      next_node = head.next
      head.next = sub_head
      tail = head if tail == nil
      sub_head = head
      head = next_node
    end
    # join segments
    pre.next = sub_head
    tail.next = head
    # reset pre to current tail, note: next tail is always null, so just ignore it
    pre = tail
  end
  dummy.next
end