def right_side_view(root)
  res ,nodes = [], [root]
  while nodes.any?
    res << nodes.last.val
    nodes = nodes.flat_map { |node| [node.left, node.right] }.select{|x| x}
  end
  res
end
