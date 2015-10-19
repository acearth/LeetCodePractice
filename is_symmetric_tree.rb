def is_symmetric(root)
  return true if root==nil
  return get_help(root.left,root.right)
end

def get_help(p,q)
  return p==q if !p || !q
  return false if p.val!=q.val
  get_help(p.left,q.right) && get_help(p.right, q.left)
end
