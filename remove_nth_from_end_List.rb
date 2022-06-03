# q-19: list remove:
# NOTE: set dummy head if head may be removed
def remove_nth_from_end(head, n)
  p = q = dummy = ListNode.new(0, head)
  n.times { q = q.next }
  p, q = p.next, q.next while q.next
  p.next = p.next.next if p.next
  dummy.next
end