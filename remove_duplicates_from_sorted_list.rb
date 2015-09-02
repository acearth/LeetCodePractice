def delete_duplicates(head)
  p=head
  while p!=nil && p.next!=nil
    p.next=p.next.next while p.next!=nil && p.val==p.next.val
    p=p.next
  end
  head
end
