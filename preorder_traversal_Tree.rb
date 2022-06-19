# Q-148: preorder tree, recursive and iterative
def preorder_traversal_recursive(root)
  return [] unless root
  [root.val] + preorder_traversal(root.left) + preorder_traversal(root.right)
end

def preorder_traversal(root)
  stack, result = [root], []
  while cur = stack.pop
    result << cur.val
    stack << cur.right if cur.right # push right first and it will pop last
    stack << cur.left if cur.left
  end
  result
end

def morris_pre_order(tree)
  result = []
  while tree
    result << tree.val
    if tree.left
      r = tree.right
      p = tree.left
      p = p.right while p && p.right
      p.right = r
    else
      tree.left = tree.right
    end
    tree = tree.left
  end
  result
end