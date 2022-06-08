# Q-530: get min diff in BST, iter-inorder and recur
def get_minimum_difference_iter(root)
  stack, pre, result = [], nil, 2 ** 32
  while stack.any? || root
    while root
      stack << root
      root = root.left
    end
    root = stack.pop
    result = [result, root.val - pre.val].min if pre
    pre = root
    root = root.right
  end
  result
end

def get_minimum_difference(root)
  get(root).each_cons(2).map { |a, b| b - a }.min
end

def get(root)
  return [] unless root
  get(root.left) + [root.val] + get(root.right)
end