def min_depth(root)
  return 0 if not root
  return min_depth(root.left)+1 if not root.right
  return min_depth(root.right)+1 if not root.left
  [min_depth(root.left), min_depth(root.right)].min + 1
end

