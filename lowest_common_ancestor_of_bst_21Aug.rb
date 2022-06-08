# Q-235: of BST rather than common tree, check Q-236 for comparing.
def lowest_common_ancestor(root, p, q)
  if (root.val <=> p.val) == (root.val <=> q.val)
    next_node = root.val > p.val ? root.left : root.right
    lowest_common_ancestor(next_node, p, q)
  else
    root
  end
end