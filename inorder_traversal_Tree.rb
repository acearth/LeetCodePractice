def inorder_traversal(tree)
  stack, result = [], []
  while tree || stack.any?
    (stack << tree; tree=tree.left) while tree
    result << stack.pop
    tree = result[-1].right
  end
  result.map(&:val)
end
