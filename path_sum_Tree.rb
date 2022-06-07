# Q-113: return sums array , preorder-way
def path_sum_iter(root, target)
  return [] unless root
  sums, result, stack = [[root.val]], [], [root]
  while stack.any?
    tree, sum = stack.pop, sums.pop
    result << sum if sum.sum == target unless tree.left || tree.right
    if tree.left
      sums << sum + [tree.left.val]
      stack << tree.left
    end
    if tree.right
      sums << sum + [tree.right.val]
      stack << tree.right
    end
  end
  result
end

def path_sum(root, target)
  return [] unless root
  paths(root, [], target)
end

def paths(root, sums, target)
  return [] unless root
  return [sums + [root.val]] if sums.sum + root.val == target unless root.left || root.right
  paths(root.left, sums + [root.val], target) + paths(root.right, sums + [root.val], target)
end