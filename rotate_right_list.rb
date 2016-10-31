def rotate_right(head, k)
  return head unless head
  p, q = head, head
  purify_k(head, k).times { p = p.next }
  while p.next && q.next
    p = p.next
    q = q.next
  end
  p.next = head
  head = q.next
  q.next = nil
  head
end

def purify_k(head, k)
  len = 0
  (head = head.next; len += 1) while head
  k % len
end
