# q-203: list op
def remove_elements(head, val)
  p = dummy = ListNode.new(0, head)
  while p
    p.next = p.next.next while p.next && p.next.val == val
    p = p.next
  end
  dummy.next
end