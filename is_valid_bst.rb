def is_valid_bst(root)
  return true if root==nil
  is_valid(root.left, (-1*2**32..root.val-1)) && is_valid(root.right,(root.val+1..2**32))
end

def is_valid(tree, interval)
  return true if tree==nil
  return false if not interval.include? tree.val
  is_valid(tree.left,(interval.begin..tree.val-1)) && is_valid(tree.right, (tree.val+1..interval.end))
end
