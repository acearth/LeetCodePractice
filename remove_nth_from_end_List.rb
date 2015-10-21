def remove_nth_from_end(head, n)
  p=r=head
  n.times{ p=p.next }
  return head.next if p==nil
  (r=r.next;p=p.next) while p.next!=nil
  r.next=r.next.next
  head
end
