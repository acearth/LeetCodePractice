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
    q = head
    k.times do
      return dummy.next unless q
      q = q.next
    end
    cur_head = cur_tail = nil
    k.times do
      next_node = head.next
      head.next = cur_head
      cur_head = head
      cur_tail ||= cur_head # depends on cur_head!
      head = next_node
    end
    cur_tail.next = head
    pre.next = cur_head
    pre = cur_tail
  end
  dummy.next
end