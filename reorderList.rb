require './base/ListNode'

def reorder_list(head)
  if head==nil
    return head
  elsif head.next==nil
    return head
  end

  l1Head=head
  head=head.next
  l2Head=head
  l1=l1Head
  l2=l2Head
  while head!=nil
    l1.next=head
    l1=l1.next
    head=head.next

    l2.next=head
    l2=l2.next
    head=head.next
  end
end





