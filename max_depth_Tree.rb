def max_depth_recursive(tree)
  return 0 if not tree
  [max_depth(tree.left), max_depth(tree.right)].max + 1
end

def max_depth(root)
  depth = 0
  q = [root]
  while q.any?
    depth += 1
    q.map! { |node| [node.left, node.right].compact }.flatten!
  end
  depth
end