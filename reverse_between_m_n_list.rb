#require './base/ListNode'

def reverse_between(head, m, n)
  originHead=head
  p=head
  pre=nil
  i=1
  while i<m
    pre=p
    p=p.next
    i+=1
  end

  h,l,lnx=reverseListWithN p,n-m+1
  l.next=lnx
  if pre==nil
    originHead=h
  else
    pre.next=h
  end
  return originHead
end

def reverseListWithN(head,n)
  neoHead=nil
  endList=head
  tail=nil
  n.times do
    pre=head
    head=head.next
    pre.next=tail
    tail=pre
  end
  neoHead=tail
  return [neoHead,endList,head]
end

l1=ListNode.new(1)
l2=ListNode.new(2)
l3=ListNode.new(3)
l4=ListNode.new(4)
l5=ListNode.new(5)
l1.next=l2
l2.next=l3
l3.next=l4
l4.next=l5
=begin
a=Array.new
h,l,ln=reverseListWithN l1,3
h.tranverse
puts
l.tranverse
puts
puts ln.tranverse


=end

l=reverse_between(l1, 2, 4)
l.tranverse
l=reverse_between(l1,1,4)
l.tranverse

