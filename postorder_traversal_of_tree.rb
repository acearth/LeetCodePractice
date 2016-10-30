def postorder_traversal(tree)
  res, stack = [], []
  while stack.any? || tree
    while tree
      stack << tree
      tree = tree.left
      last = tree
    end
    if last == stack.last.right
      last = stack.pop
      res << last.val
    else
      last = tree = stack.last.right
    end
  end
  res
end
