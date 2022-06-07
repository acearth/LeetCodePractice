def invert_tree(root)
  return unless root
  invert_tree(root.left)
  invert_tree(root.right)
  root.left, root.right = root.right, root.left
  root
end