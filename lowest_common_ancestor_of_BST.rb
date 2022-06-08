# Q-235: of BST rather than common tree, check Q-236 for comparing.
def lowest_common_ancestor_recursive(root, p, q)
  if (root.val <=> p.val) == (root.val <=> q.val)
    next_node = root.val > p.val ? root.left : root.right
    lowest_common_ancestor(next_node, p, q)
  else
    root
  end
end

# iter-way
def lowest_common_ancestor(root, p, q)
  stack = [root]
  while stack.any?
    root = stack.pop
    return root if [p, q].include? root
    return root if (root.val <=> p.val) != (root.val <=> q.val)
    stack << root.right if root.right
    stack << root.left if root.left
  end
end