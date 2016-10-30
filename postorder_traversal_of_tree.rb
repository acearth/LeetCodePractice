def postorder_traversal(tree)
  result, stack = [], []
  while stack.any? || tree
    while tree
      stack << tree
      last = tree = tree.left
    end
    last == stack.last.right ? result << (last = stack.pop).val
                             : last = tree = stack.last.right
  end
  result
end
