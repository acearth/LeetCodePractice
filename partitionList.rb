require './base/ListNode'

def partition(head, x)
  return if head==nil
  large, l2Head=nil, nil
  small, l1Head=nil, nil
  p=head
  while p!=nil
    pNext=p.next
    if p.val>=x
      if large==nil
        large=p
        l2Head=large
        large.next=nil
      else
        large.next=p
        large=large.next
        large.next=nil
      end
    else
      if small==nil
        small=p
        l1Head=small
        small.next=nil
      else
        small.next=p
        small=small.next
        small.next=nil
      end
    end
    p=pNext
  end
  if l1Head!=nil
    small.next=l2Head
    return l1Head
  else
    return l2Head
  end
end


l1=ListNode.new(1)
l2=ListNode.new(1)
l1.next=l2

partition(l1, 0)

puts "uc 2"
l1=ListNode.new(2)
l2=ListNode.new(1)
l1.next=l2

partition l1, 2

puts
l001=ListNode.new(1)
partition l001, 1

