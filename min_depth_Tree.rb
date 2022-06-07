def min_depth_recursive(root)
  return 0 if not root
  return min_depth(root.left)+1 if not root.right
  return min_depth(root.right)+1 if not root.left
  [min_depth(root.left), min_depth(root.right)].min + 1
end

def min_depth(root)
  return 0 unless root
  depth, q = 0, [root]
  while q.any?
    depth+=1
    q.map! do |node|
      return depth if !node.left && !node.right
      [node.left,node.right].compact
    end.flatten!
  end
end