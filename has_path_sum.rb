def has_path_sum(root, target)
  return false unless root
  sums, stack = [root.val], [root]
  while stack.any?
    tree, sum = stack.pop, sums.pop
    return true if sum == target unless tree.left || tree.right
    if tree.right
      stack << tree.right
      sums << sum + tree.right.val
    end
    if tree.left
      stack << tree.left
      sums << sum + tree.left.val
    end
  end
  false
end

def has_path_sum_recur(root, target)
  path_sum(root, 0, target)
end

def path_sum(root, sum, target)
  return false unless root
  return true if sum + root.val == target unless root.left || root.right
  path_sum(root.left, sum + root.val, target) || path_sum(root.right, sum + root.val, target)
end