require './base/ListNode'

def reorder_list(head)
  return true if head==nil ||head.next==nil
  count=0
  p=head
  while p!=nil
    p=p.next
    count+=1
  end
  return head if count<3
  q=head
  c=count/2+count%2
  oldTail=nil
  c.times do |i|
    oldTail=q if i==c-1
    q=q.next
  end
  oldTail.next=nil
  tail=q
  q=q.next if q.next!=nil
  tail.next=nil
  loop do
    qNext=q.next
    if q!=tail
      q.next=tail
      tail=q
    end
    break if qNext==nil
    q=qNext
  end
  p=head

  while q!=nil
    pNext=p.next
    qNext=q.next
    p.next=q
    q.next=pNext
    p=pNext
    q=qNext
  end
  return head
end

l1=ListNode.new(1)
l2=ListNode.new(2)
l3=ListNode.new(3)
l4=ListNode.new(4)
l5=ListNode.new(5)
l1.next=l2
l2.next=l3
#l3.next=l4
#l4.next=l5
p reorder_list l1
