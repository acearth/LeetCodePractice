def assert(tree)
  return 0 if not tree
  left, right = assert(tree.left), assert(tree.right)
  raise if (left - right).abs > 1 # unbalanced
  1 + [left, right].max # height
end

def is_balanced(root)
  assert(root) && true rescue false
end
