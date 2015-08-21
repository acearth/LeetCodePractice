require './base/ListNode'

def reverse_k_group(head, k)
  return head if k==1
  headReal=nil
  pre=nil
  p=head
  while p!=nil
    newHead, newTail, realNext, isComplete=reverseKnode(p, k)
    if !isComplete
      newHead, newTail, realNext, isComplete=reverseKnode(newHead, k)
      if pre!=nil
        pre.next=newHead
      else
        headReal=newHead
      end
      break
    end

    headReal=newHead if headReal==nil
    pre.next=newHead if pre!=nil
    pre=newTail
    p=realNext
    break if p==nil
  end
  return headReal
end

# @return {newHead,newTail,realNext,isComplete}
def reverseKnode(head, n)
  return nil, nil, nil, false if head==nil
  isComplete=true
  newTail=head
  tail=head
  p=tail.next
  while p!=nil
    preNext=p.next
    p.next=tail
    tail.next=nil if tail.equal? newTail
    tail=p
    p=preNext
    n-=1
    break if n<2
  end
  isComplete=false if n>1
  return tail, newTail, preNext, isComplete
end

l1=ListNode.new(1)
l2=ListNode.new(2)
l3=ListNode.new(3)
l4=ListNode.new(4)
l5=ListNode.new(5)
l6=ListNode.new(6)
l1.next=l2
l2.next=l3
l3.next=l4
l4.next=l5
#l5.next=l6
#ln=reverse_k_group l1,3
ln=reverse_k_group l1, 2
ln.tranverse

puts
ln1=reverse_k_group l6,2
ln1.tranverse
