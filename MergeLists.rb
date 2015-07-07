def merge_two_lists(l1,l2)
  return nil if l1==nil&&l2==nil
  return l1 if l2==nil
  return l2 if l1==nil
  if l1.val>l2.val
    head=l1
  else
    head=l2
  end
  p=head
  while l1.next!=nil&&l2.next!=nil
    if l1.next<l2.next
      p.next=l1.next
      p=p.next
      l1=l1.next
      end
  else
    p.next=l2.next
    p=p.next
    l2=l2.next
  end
  p.next=l1 if l1.next!=nil
  p.next=l2 if l2.next!=nil
end



