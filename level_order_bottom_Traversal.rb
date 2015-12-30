def level_order_bottom(tree)
  cur, result = [tree], []
  while cur.any?
    result << cur.map(&:val)
    cur = cur.map{|tr| [tr.left,tr.right].compact }.flatten
  end
  result.reverse
end
