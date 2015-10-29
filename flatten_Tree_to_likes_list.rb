def flatten(tree)
  return if not tree
  flatten(tree.right)
  return if tree.left==nil
  flatten(tree.left)
  last=tree.left
  last=last.right while last.right!=nil
  tree.right,last.right=tree.left, tree.right
  tree.left=nil
end
