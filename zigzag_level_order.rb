def level_order(root)
  return [] if not root
  queue, result = [root], []
  while !queue.empty?
    result << queue.map(&:val)
    queue.map! { |node| [node.left, node.right] }.flatten!.compact!
  end
  result
end

def zigzag_level_order(root)
  result = level_order(root)
  result.size.times { |i| result[i].reverse! if i.odd? }
  result
end
