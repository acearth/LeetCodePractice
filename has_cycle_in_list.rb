def has_cycle(head)
  p = q = head
  while q && q.next
    p = p.next
    q = q.next.next
    return true if p == q
  end
  false
end

def hasCycle(head)
  has_cycle(head)
end