def preorder_traversal(tree)
  result, stack = [], []
  while tree || stack.any?
    while tree
      result << tree.val
      stack << tree
      tree = tree.left
    end
    tree = stack.pop.right
  end
  result
end
