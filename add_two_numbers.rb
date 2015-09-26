def add_two_numbers(l1, l2)
  p, q=l1, l2
  com=0
  dummy=ListNode.new(0)
  head=dummy
  while p!=nil&&q!=nil
    value=p.val+q.val+com
    dummy.next=ListNode.new(value%10)
    com=value/10
    dummy=dummy.next
    p, q = p.next, q.next
  end
  p=q if q!=nil
  while p!=nil
    value=p.val+com
    dummy.next=ListNode.new(value%10)
    com=value/10
    dummy=dummy.next
    p=p.next
  end
  dummy.next=ListNode.new(com) if com!=0
  head.next
end


