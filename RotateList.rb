

def rotate_right(head, k)
  if head ==nil
    return
  elsif head.next==nil
    return head
  end
  originHead=head
  length=1
  while head.next!=nil
    head=head.next
    length+=1
  end
  head.next=originHead
  k=k%length
  step=length-k
  while step>0
    head=head.next
    step-=1
  end
  originHead=head.next
  head.next=nil
  return originHead
end

l1=ListNode.new(10)
l2=ListNode.new(20)
l3=ListNode.new(30)
l4=ListNode.new(40)
l5=ListNode.new(50)
l1.next=l2
l2.next=l3
l3.next=l4
l4.next=l5
