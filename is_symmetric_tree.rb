# Q-101
def is_symmetric_recursive(root)
  check(root.left, root.right)
end

def check(left, right)
  return left == right unless left && right
  return false unless left.val == right.val
  check(left.left, right.right) && check(left.right, right.left)
end

def is_symmetric_level_order(root)
  next_queue = [root.left, root.right]
  while next_queue.any?
    deque, next_queue = next_queue, []
    while (deque.any?)
      left, right = deque.shift, deque.pop
      next unless left || right # check next-pair if both left and right is nil
      return false if (!left && right) || (left && !right)
      return false unless left.val == right.val
      next_queue = [left.left, left.right] + next_queue + [right.left, right.right]
    end
  end
  true
end

def is_symmetric_preorder(root)
  return true unless root
  lstack, rstack = [root.left], [root.right]
  while lstack.any? || rstack.any?
    p, q = lstack.pop, rstack.pop
    next if !p && !q
    return false if (p && !q) || (!p && q) || p.val != q.val
    lstack << p.right
    lstack << p.left
    rstack << q.left
    rstack << q.right
  end
  true
end