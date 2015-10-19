def max_depth(tree)
  return 0 if not tree
  [max_depth(tree.left), max_depth(tree.right)].max + 1
end
