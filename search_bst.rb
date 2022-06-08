# Q-700: iter + recur
def search_bst_recur(root, val)
  return root if !root || root.val == val
  root.val > val ? search_bst(root.left, val) : search_bst(root.right, val)
end

def search_bst(root, val)
  while root
    return root if root.val == val
    root = (root.val > val ? root.left : root.right)
  end
end