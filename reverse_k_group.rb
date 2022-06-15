def reverse_k_group_iterative(head, k)
  pre = dummy = ListNode.new(0, head)
  while head
    curr = head
    k.times do
      return dummy.next unless head
      head = head.next
    end
    curr_head = curr_tail = nil
    while curr != head
      curr_next = curr.next
      curr.next = curr_head
      curr_tail ||= curr
      curr_head = curr
      curr = curr_next
    end
    pre.next = curr_head
    curr_tail.next = head
    pre = curr_tail
  end
  dummy.next
end

def reverse_k_group(head, k)
  cur = head
  k.times do
    return cur unless head
    head = head.next
  end
  cur_tail = cur_head = nil
  while cur != head
    cur_next = cur.next
    cur.next = cur_head
    cur_tail ||= cur
    cur_head = cur
    cur = cur_next
  end
  cur_tail.next = reverse_k_group(head, k)
  cur_head
end

require './helper/list_node'
reverse_k_group(ListNode.generate([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]), 3).traverse