# question 138
def copyRandomList(head)
  node = head
  while node
    copy_node, next_node = Node.new(node.val), node.next
    node.next = copy_node
    copy_node.next = next_node
    node = next_node
  end
  node = head
  while node
    node.next.random = node.random ? node.random.next : nil
    node = node.next.next
  end
  node = head
  # note: this step is important for separating the copy-existing lists
  copy_head = node.next if node
  while node
    next_node = node.next
    node.next = node.next.next if node.next
    node = next_node
  end
  copy_head
end