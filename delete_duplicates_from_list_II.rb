def delete_duplicates(head)
  return head if head==nil ||head.next==nil
  if head.val !=head.next.val
    head.next=delete_duplicates(head.next)
    head
  else
    cur=head.val
    head=head.next while head!=nil && head.val==cur
    delete_duplicates(head)
  end
end
