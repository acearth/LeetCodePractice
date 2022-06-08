# Q-145: post-order of tree, iterate way
def postorder_traversal(root)
  stack, result = [], []
  while stack.any? || root
    while root
      stack << root
      last = root = root.left
    end
    if last == stack.last.right
      last = stack.pop
      result << last.val
    else
      last = root = stack.last.right
    end
  end
  result
end