def partition(head, pivot)
  larger = larger_tail = ListNode.new(-1)
  smaller = smaller_tail = ListNode.new(-1)
  while head
    if head.val < pivot
      smaller_tail.next = head
      smaller_tail = head
    else
      larger_tail.next = head
      larger_tail = head
    end
    head = head.next
  end
  larger_tail.next = nil
  smaller_tail.next = larger.next
  smaller.next
end
