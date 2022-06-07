# Q-148: preorder tree, recursive and iterative
def preorder_traversal_recursive(root)
  return [] unless root
  [root.val] + preorder_traversal(root.left) + preorder_traversal(root.right)
end

def preorder_traversal(root)
  stack, result = [root], []
  while cur = stack.pop
    result << cur.val
    stack << cur.right if cur.right
    stack << cur.left if cur.left
  end
  result
end
