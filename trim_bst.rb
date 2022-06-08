# Q-669: trim a BST
def trim_bst_recur(root, low, high)
  return unless root
  if (low..high).include? root.val
    root.left = trim_bst(root.left, low, high)
    root.right = trim_bst(root.right, low, high)
  elsif low > root.val
    root = trim_bst(root.right, low, high)
  else
    root = trim_bst(root.left, low, high)
  end
  root
end

# TODO-replay
def trim_bst(root, low, high)
  return unless root
  while root && (root.val < low || root.val > high)
    root = root.val > high ? root.left : root.right
  end
  p = q = root
  while p
    p.left = p.left.right while p.left && p.left.val < low
    p = p.left
  end
  while q
    q.right = q.right.left while q.right && q.right.val > high
    q = q.right
  end
  root
end