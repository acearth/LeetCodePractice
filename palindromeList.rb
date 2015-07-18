require './base/ListNode'
def is_palindrome(head)
  return true if head==nil ||head.next==nil
  count=0
  p=head
  while p!=nil
    p=p.next
    count+=1
  end
  q=head
  (count/2+count%2).times do
    q=q.next
  end
  tail=q
  q=q.next if q.next!=nil
  tail.next=nil
  loop do
    qNext=q.next
    q.next=tail
    tail=q
    break if qNext==nil
    q=qNext
  end
  (count/2).times do
    return false if head.val!=q.val
    head=head.next
    q=q.next
  end
  return true
end

l1=ListNode.new(1)
l2=ListNode.new(2)
l3=ListNode.new(3)
l4=ListNode.new(2)
l5=ListNode.new(1)
l1.next=l2
#l2.next=l3
#l3.next=l4
#l4.next=l5
p is_palindrome l1
