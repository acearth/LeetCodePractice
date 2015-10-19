def swap_pairs(head)
  return head if head==nil || head.next==nil
  neo=head.next
  pNext=neo.next
  head.next=swap_pairs(pNext)
  neo.next=head
  neo
end
