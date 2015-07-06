require './base/ListNode'

def reverse_list(head)
  if head==nil
    return head
  else
    base=head
    head=head.next
    base.next=nil
    while (head!=nil)
      nextP=head.next
      head.next=base
      base=head
      head=nextP
    end
    return base
  end
end

l1=ListNode.new(1)
l2=ListNode.new(2)
l3=ListNode.new(3)

l1.next=l2
l2.next=l3
h=l1
lk=reverse_list h
lk.tranverse


