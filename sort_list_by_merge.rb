def cut(list, len)
  while list && len > 1
    list = list.next
    len -= 1
  end
  return unless len == 1 && list
  tail = list.next
  list.next = nil
  tail
end

def merge(l1, l2)
  tail = got = ListNode.new(0)
  while l1 && l2
    if l1.val < l2.val
      tail.next = l1
      l1 = l1.next
    else
      tail.next = l2
      l2 = l2.next
    end
    tail = tail.next
  end
  tail.next = l1 ? l1 : l2
  tail = tail.next while tail.next
  [got.next, tail]
end

def sort_list(head)
  tail = sorted = ListNode.new(0)
  step = 1
  loop do
    loop_count = 0
    while head
      list1, list2 = head, cut(head, step)
      head = list2 ? cut(list2, step) : nil
      part_head, part_tail = merge(list1, list2)
      tail.next = part_head
      tail = part_tail
      loop_count += 1
    end
    break if loop_count < 2
    tail, head = sorted, sorted.next
    step *= 2
  end
  sorted.next
end
