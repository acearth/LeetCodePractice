def is_same_tree(p,q)
  return p==q if not p or not q
  return false if p.val!=q.val
  is_same_tree(p.left,q.left) and is_same_tree(p.right,q.right)
end
