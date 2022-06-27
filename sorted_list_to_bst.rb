# Q-109: sorted listed to BST: recursive way
def sorted_list_to_bst(head)
  size = 0
  p = head
  while p
    p = p.next
    size += 1
  end
  gen(head, size)
end

def gen(list, size)
  return unless list && size > 0
  p = list
  (size / 2).times { p = p.next }
  TreeNode.new(p.val, gen(list, size / 2), gen(p.next, size - size / 2 - 1))
end

# require './helper/tree_node'
# require './helper/list_node'
# l = ListNode.generate([-10, -3, 0, 5, 9])
# p sorted_list_to_bst(l)
