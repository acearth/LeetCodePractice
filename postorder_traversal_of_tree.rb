# Q-145: iter way
def postorder_traversal(root)
  pre, stack, result = nil, [], []
  while stack.any? || root
    if root
      stack << root
      root = root.left
    elsif pre != stack.last.right
      pre = root = stack.last.right
    else
      result << stack.last.val
      pre = stack.pop
    end
  end
  result
end
