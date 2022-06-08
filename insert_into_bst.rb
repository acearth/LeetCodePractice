# Q-701: insert element to BST
def insert_into_bst_iter(root, val)
  return TreeNode.new(val) unless root
  tree = root
  while tree
    if tree.val > val && !tree.left
      tree.left = TreeNode.new(val)
      return root
    elsif tree.val > val
      tree = tree.left
    elsif tree.val < val && !tree.right
      tree.right = TreeNode.new(val)
      return root
    else
      tree = tree.right
    end
  end
end

def insert_into_bst(root, val)
  return TreeNode.new(val) unless root
  insert(root, val)
  root
end

def insert(root, val)
  return TreeNode.new(val) unless root
  if root.val > val
    added = insert(root.left, val)
    root.left ||= added
  else
    added = insert(root.right, val)
    root.right ||= added
  end
end