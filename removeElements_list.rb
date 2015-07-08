require './base/ListNode'
def remove_elements(head,val)
  return if head==nil
  return if head.val==val&&head.next==nil
  return head if head.val!=nil&&head.next==nil
  return if head.val!=nil&&head.next==nil
  p=head
  rH=nil
  pro=rH
  while p!=nil
    pNext=p.next
    if p.val!=val
      if rH==nil
        pro=p
        rH=pro
        pro.next=nil
      else
        pro.next=p
        pro=pro.next
        pro.next=nil
      end
    end
    p=pNext
  end
  rH.tranverse
  return rH
end

l1=ListNode.new(1)
l2=ListNode.new(2)
l3=ListNode.new(3)
l4=ListNode.new(3)
l5=ListNode.new(4)
l1.next=l2
l2.next=l3
l3.next=l4
l4.next=l5
remove_elements(l1,1)
puts

#remove_elements(l1,1)



