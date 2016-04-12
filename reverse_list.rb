def reverse_list(head)
  return reverse(head).first if head
end

def reverse(head)
  return [head, head] unless head.next
  neo, tail = reverse(head.next)
  tail.next = head
  head.next = nil
  [neo, head]
end
