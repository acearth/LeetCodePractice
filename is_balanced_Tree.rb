def check(tree)
  return 0 if not tree
  left, right = check(tree.left), check(tree.right)
  raise if (left - right).abs > 1 # unbalanced
  1 + [left, right].max # height of balanced tree
end

def is_balanced(root)
  check(root) != false
rescue
  false
end
