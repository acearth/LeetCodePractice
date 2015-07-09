require './base/ListNode'

def insertion_sort_list(head)
  return head if head==nil||head.next==nil
  sorted=head
  p=head.next
  sorted.next=nil
  tail=sorted
  while p!=nil
    hNext=p.next
    sorted,tail=insertTo(sorted,tail, p)
    p=hNext
  end
  return sorted
end

def insertTo(lh, le, lp)
  head=lh
  nextP=lh.next
  if lh==nil
    head=lp
    le=head
    lp.next=nil
  else
    if lp.val<=lh.val
      head=lp
      head.next=lh
      #le no change
    elsif lp.val>=le.val
      le.next=lp
      lp.next=nil
      le=lp
    else
      nextP,newTail=insertTo(lh.next, le, lp)
      # newTail is useless because it occurs in body rather than tail
      head.next=nextP
    end
  end
  return head, le
end

l1=ListNode.new(4)
l2=ListNode.new(2)
l3=ListNode.new(1)
l4=ListNode.new(3)
l5=ListNode.new(0)
l1.next=l2
l2.next=l3
l3.next=l4
l4.next=l5

lt=insertion_sort_list l1
lt.tranverse

