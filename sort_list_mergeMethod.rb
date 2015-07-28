require './base/ListNode'

def getNewPartition(list, k)
  p=list
  (k-1).times { break if list==nil; list=list.next }
  return p,nil,nil if list==nil
  q=list.next
  list.next=nil
  list=q
  (k-1).times { break if list==nil; list=list.next }
  if list!=nil
    remain=list.next
    list.next=nil
  else
    remain=nil
  end
  return p, q, remain
end

def merge_List(h1, h2)
  return h1 if h2==nil
  newHead, p=nil, nil
  while h1!=nil && h2!=nil
    cur=h1.val<=h2.val ? h1 : h2
    if cur==h1
      h1=h1.next
    else
      h2=h2.next
    end
    if p==nil
      newHead=p=cur
    else
      p.next=cur
      p=p.next
    end
  end
  p.next= h1!=nil ? h1 : h2
  while p!=nil
    tail=p
    p=p.next
  end
  return newHead, tail
end

def sort_list(head)
  k=1
  loop do
    count=0
    listHead=nil
    nextPre=nil
    while head!=nil
      p, q, head=getNewPartition(head, k)
      count+=1
      sHead, tail=merge_List p, q
      if listHead==nil
        listHead=sHead
      else
        nextPre.next=sHead
      end
      nextPre=tail
    end
    head=listHead
    break if count<2
    k+=k
  end
  head
end


l1=ListNode.new(1)
l2=ListNode.new(5)
l3=ListNode.new(3)
l4=ListNode.new(2)
j1=ListNode.new(7)
j2=ListNode.new(4)
j3=ListNode.new(6)
j4=ListNode.new(8)
l1.next=l2
l2.next=l3
l3.next=l4

j1.next=j2
j2.next=j3
j3.next=j4

l4.next=j1
k1=ListNode.new(0)
k2=ListNode.new(9)
j4.next=k1
k1.next=k2

l1.tranverse
puts
l=sort_list l1
l.tranverse

