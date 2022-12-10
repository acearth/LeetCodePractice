MEMO = {}

def count_nodes(root)
  return 0 unless root
  left_height, left_full = height_and_full?(root.left)
  left_full ? 2 ** left_height + count_nodes(root.right)
    : 2 ** (left_height - 1) + count_nodes(root.left)
end

def height_and_full?(root)
  return MEMO[root] if MEMO[root]
  return [0, true] unless root
  p, q = root.left, root.right
  height = 1
  while p && q
    p, q = p.left, q.right
    height += 1
  end
  MEMO[root] = p && !q ? [height + 1, false] : [height, true]
end

# Q-222: binary search way for counting complete tree nodes
# 10/dec/2022
def count_nodes(root)
  return 0 unless root
  return 1 unless root.left || root.right
  h = height(root)
  delta = 2 ** (h - 2)
  left, right = 0, delta * 2
  while left < right
    m = (left + right) / 2
    if bsearch(root, m, delta)
      left = m + 1
    else
      right = m
    end
  end
  2 ** (h - 1) + left - 1
end

def height(root)
  h = 0
  while root
    h += 1
    root = root.left
  end
  h
end

def bsearch(root, i, delta)
  while root && delta > 0
    if i < delta
      root = root.left
    else
      root = root.right
      i -= delta
    end
    delta /= 2
  end
  root != nil
end