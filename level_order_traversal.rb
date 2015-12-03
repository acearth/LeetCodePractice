def level_order(root)
  return [] if not root
  queue, result = [root], []
  while queue.size > 0
    result << queue.map(&:val)
    queue = queue.map { |node| [node.left, node.right] }.flatten.compact
  end
  result
end
