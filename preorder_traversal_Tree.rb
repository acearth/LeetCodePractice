def preorder_traversal(tree)
  stack, result = [tree], []
  while stack.any?
    tree = stack.pop
    result << tree.val
    stack << tree.right if tree.right
    stack << tree.left if tree.left
  end
  result
end

