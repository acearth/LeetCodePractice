def insertion_sort_list(head)
  sorted = ListNode.new(0)
  while head
    node,node.next, head = head, nil, head.next
    insert(sorted, node)
  end
  sorted.next
end

def insert(sorted, node)
  p, value = sorted, node.val
  p = p.next while p.next && p.next.val < value
  pre_next = p.next
  p.next = node
  node.next = pre_next
end
