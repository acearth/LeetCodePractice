require './base/ListNode'
def rotate_right(head, k)
  return head if k==0 || head==nil|| head.next==nil
  p=head
  size=0
  (size+=1; p=p.next ) while p!=nil
  return head if k%size==0
  step=size-k%size-1
  newTail=head
  step.times {newTail=newTail.next}
  newHead=newTail.next
  newTail.next=nil
  adjacent=newHead
  adjacent=adjacent.next while adjacent.next!=nil
  adjacent.next=head
  newHead
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
p rotate_right(l1,2).tranverse
