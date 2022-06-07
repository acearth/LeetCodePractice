def level_order(root)
  queue, result = [root], []
  while queue.any?
    result << queue.map(&:val)
    queue.map! { |node| [node.left, node.right].compact }.flatten!
  end
  result
end
#Thanks to @StefanPochmann for modifying my solution.