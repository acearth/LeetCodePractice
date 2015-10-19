def has_path_sum(root, sum,cur=0)
  return false if not root
  cur+=root.val
  return true if cur == sum && !root.left && !root.right
  has_path_sum(root.left,sum,cur) || has_path_sum(root.right,sum,cur)
end
