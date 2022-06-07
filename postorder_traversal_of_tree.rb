# for post order, we must set additional information to mark parent
def postorder_traversal(tree)
  result, stack = [], []
  while stack.any? || tree
    while tree
      stack << tree
      last = tree = tree.left
    end
    if last == stack.last.right # if next node is parent
      result << (last = stack.pop).val
    else
      last = tree = stack.last.right # after visited left, we get parents from stack and set current to its right child
    end
  end
  result
end