require './base/ListNode'

def delete_duplicates(head)
  newHead=nil
  pre=nil
  p=head
  while p!=nil
    shouldAdd=true
    while p.next!=nil&&p.val==p.next.val
      p=p.next
      shouldAdd=false
    end
    p=p.next if shouldAdd==false
    if shouldAdd==true
      pNext=p.next
      if pre==nil
        pre=p
        newHead=p
      else
        pre.next=p
        pre=pre.next
      end
      p.next=nil
      p=pNext
    end
  end
  newHead
end

l1=ListNode.new(1)
l2=ListNode.new(1)
l1.next=l2
p delete_duplicates(l1)
l1=ListNode.new(1)
l2=ListNode.new(2)
l3=ListNode.new(2)
l1.next=l2
l2.next=l3
p delete_duplicates(l1)
l1=ListNode.new(1)
l2=ListNode.new(1)
l3=ListNode.new(2)
l1.next=l2
l2.next=l3
p delete_duplicates(l1)

