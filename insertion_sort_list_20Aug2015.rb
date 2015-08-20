def insertion_sort_list(head)
  return head if head==nil || head.next==nil
  p=head.next
  head.next=nil
  while p!=nil
    pNext=p.next
    p.next=nil
    head=insert(head,p)
    p=pNext
  end
  head
end

def insert(sorted,target)
  if target.val<sorted.val
    target.next=sorted
    return target
  else
    pre=sorted
    q=pre.next
    while q!=nil
      break if q.val>target.val
      pre=q
      q=q.next
    end
    pre.next=target
    target.next=q
    sorted
  end
end
