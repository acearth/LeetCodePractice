def invert_tree(root)
  return if not root
  invert_tree(root.left)
  invert_tree(root.right)
  root.left,root.right = root.right, root.left
  root
end
