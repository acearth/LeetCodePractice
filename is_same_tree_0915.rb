def is_same_tree(p,q)
  return p==nil if not q
  return q==nil if not p
  return false if p.val!=q.val
  is_same_tree(p.left,q.left) and is_same_tree(p.right,q.right)
end
