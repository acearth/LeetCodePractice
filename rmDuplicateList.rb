require './base/ListNode'

def delete_duplicates(head)
  return if head==nil
  return head if head.next==nil
  p=head
  while true
    cur=p
    while p.next!=nil
      if p.val==p.next.val
        p=p.next
      else
        break
      end
    end
    cur.next=p.next
    p=p.next
    break if p==nil
  end
  return head
end

  l1=ListNode.new(1)
  l1.next=ListNode.new(1)
  delete_duplicates(l1)
  l1.tranverse
  puts



