def count_nodes(root)
  return 0 unless root
  left_height, left_full = height_and_full?(root.left)
  left_full ? 2 ** left_height + count_nodes(root.right)
            : 2 ** (left_height - 1) + count_nodes(root.left)
end

def height_and_full?(root)
  return [0, true] unless root
  p, q = root.left, root.right
  height = 1
  while p && q
    p, q = p.left, q.right
    height += 1
  end
  p && !q ? [height+1, false] : [height, true]
end
