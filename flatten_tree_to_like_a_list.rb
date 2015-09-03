def flatten(tree)
  flatten_help(tree)
  return ##need to return nothing
end
def flatten_help(tree)
  return nil if tree==nil
  right=flatten_help(tree.right)
  tree.right=flatten_help(tree.left)
  p=tree
  p=p.right while p.right!=nil
  p.right=right
  tree.left=nil
  tree
end
