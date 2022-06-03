# q-206: reverse list iteratively and recursively
def reverse_list(head)
  got = nil
  while head
    next_node = head.next
    head.next = got
    got = head
    head = next_node
  end
  got
end

# recursive way on 2016
def reverse_list_recursively(head)
  return reverse(head).first if head
end

def reverse(head)
  return [head, head] unless head.next
  neo, tail = reverse(head.next)
  tail.next = head
  head.next = nil
  [neo, head]
end
