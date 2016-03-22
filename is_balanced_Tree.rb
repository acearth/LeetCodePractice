def assert(tree)
  return 0 if not tree
  left, right = assert(tree.left), assert(tree.right)
  (left - right).abs > 1 ? raise : 1 + [left, right].max
end

def is_balanced(root)
  assert(root) && true rescue false
end
