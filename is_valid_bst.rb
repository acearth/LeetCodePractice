# Q-98: is valid BST? iter + recur
def is_valid_bst_recur(root)
  is_valid(root, (-1 * 2 ** 32...2 ** 32))
end

def is_valid(tree, range)
  return true unless tree
  return false unless range.include? tree.val
  is_valid(tree.left, (range.begin...tree.val)) && is_valid(tree.right, (tree.val + 1...range.end))
end

def is_valid_bst(root)
  stack, range = [root], [-1 * 2 ** 32...2 ** 32]
  while stack.any?
    tree = stack.pop
    curr = range.pop
    return false unless curr.include? tree.val
    if tree.right
      stack << tree.right
      range << (tree.val + 1...curr.end)
    end
    if tree.left
      stack << tree.left
      range << (curr.begin...tree.val)
    end
  end
  true
end