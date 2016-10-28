def inorder_traversal(root)
  @stack, res = [], []
  while @stack.any? || root
    while root
      @stack << root
      root = root.left
    end
    root = @stack.pop
    res << root.val
    root = root.right
  end
  res
end
