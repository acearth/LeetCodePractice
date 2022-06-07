def inorder_traversal(root)
  stack, result = [], []
  while stack.any? || root
    while root
      stack << root
      root = root.left
    end
    root = stack.pop
    result << root.val
    root = root.right
  end
  result
end