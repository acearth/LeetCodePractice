def remove_nth_from_end(head, n)
  return if head==nil||head.next==nil
  k=0
  p=head
  pd=nil
  while p!=nil
    if k<n
      k+=1
    else
      if pd==nil
        pd=head
      else
        pd=pd.next
      end
    end
    p=p.next
  end

  if pd==nil
    return head.next
  else
    pd.next=pd.next.next if pd.next!=nil
    return head
  end
end

l1=ListNode.new(1)
l2=ListNode.new(2)
l1.next=l2




