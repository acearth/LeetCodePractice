def invert_tree(root)
  return root if root==nil
  root.left,root.right=root.right,root.left
  invert_tree(root.left)
  invert_tree(root.right)
  root
end
