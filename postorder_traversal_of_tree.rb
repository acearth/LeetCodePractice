# Q-145: iter way
def postorder_traversal(root)
  result, stack, pre = [], [], nil
  while stack.any? || root
    while root
      stack << root
      root = root.left
    end
    if pre == stack.last.right
      pre = stack.pop
      result << pre.val
    else
      pre = root = stack.last.right
    end
  end
  result
end