# Q-236: post order traversal and find it
# NOTE for border condition
def lowest_common_ancestor(root, p, q)
  return root if [p, q, nil].include? root
  left = lowest_common_ancestor(root.left, p, q)
  right = lowest_common_ancestor(root.right, p, q)
  left && right ? root : left || right
end