def level_order(root)
  return [] if not root
  result, next_queue = [], [root]
  loop do
    queue=next_queue
    break if queue.size==0
    result<<queue.map(&:val)
    next_queue = queue.map{|node| [node.left,node.right]}.flatten.compact
  end
  result
end
