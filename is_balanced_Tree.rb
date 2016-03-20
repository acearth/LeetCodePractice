def check(tree)
  return 0 if not tree
  left, right = check(tree.left), check(tree.right)
  raise if (left - right).abs > 1 # unbalanced
  1 + [left, right].max # height
end

def is_balanced(root)
  check(root) && true
rescue
  false
end
