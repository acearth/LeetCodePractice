def is_symmetric(tree)
  tree ? is_sym(tree.left, tree.right) : true
end

def is_sym(p, q)
  return p==q if !p || !q
  return false if p.val!=q.val
  is_sym(p.left, q.right) && is_sym(p.right, q.left)
end
