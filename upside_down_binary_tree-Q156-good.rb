# Q-156: upside down binary tree iter and recur - way
# 3/jan/2022
def upside_down_binary_tree(root)
  return root unless root && root.left
  neo = upside_down_binary_tree(root.left)
  root.left.left = root.right
  root.left.right = root
  root.left = root.right = nil
  neo
end

# iterative solution
# created at 20/dec/2022
def upside_down_binary_tree(root)
  stack = []
  while root && root.left
    stack << root
    stack << root.right
    left = root.left
    root.left = root.right = nil
    root = left
  end
  p = root
  while stack.any?
    p.left = stack.pop
    p.right = stack.pop
    p = p.right
  end
  root
end



