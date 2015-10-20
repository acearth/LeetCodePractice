def heightOf(tree)
  return 0 if not tree
  leftH=heightOf(tree.left)+1
  rightH=heightOf(tree.right)+1
  leftH>rightH ? leftH : rightH
end
def is_balanced(root)
  return true if not root
  return false if (heightOf(root.left)-heightOf(root.right)).abs>1
  is_balanced(root.left) and is_balanced(root.right)
end
