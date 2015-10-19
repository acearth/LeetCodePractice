def is_palindrome(head)
  p=q=head
  count=0
  (count+=1; p=p.next) while p !=nil
  count = count>>1
  count.times { q=q.next }
  tail=nil
  while q!=nil
    qNext=q.next
    q.next=tail
    tail=q
    q=qNext
  end
  while tail!=nil
    return false if tail.val!=head.val
    tail, head =tail.next, head.next
  end
  true
end
