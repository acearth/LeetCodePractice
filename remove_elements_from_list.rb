def remove_elements(head, val)
  new_head, new_head.next = ListNode.new(1), head
  pre, p = new_head, head
  while p
    pre.next = p &&  pre = p if p.val != val
    p = p.next
  end  
  pre.next = nil
  new_head.next
end
