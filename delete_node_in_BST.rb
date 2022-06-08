# Q-450: delete one node in BST
# ITER-way: need to be improved! TODO-improve
def delete_node_iter(root, key)
  return unless root
  parent = tree = root
  while tree
    break if tree.val == key
    parent = tree
    tree = (tree.val > key ? tree.left : tree.right)
  end
  return root unless tree
  if tree == root
    if tree.left == nil
      return tree.right
    elsif tree.right == nil
      return tree.left
    else
      cur = tree.right
      cur = cur.left while cur.left
      cur.left = tree.left
      return tree.right
    end
  elsif !tree.left && !tree.right
    reset(parent, tree, nil)
  elsif !tree.left && tree.right
    reset(parent, tree, tree.right)
  elsif !tree.right && tree.left
    reset(parent, tree, tree.left)
  else
    cur = tree.right
    cur = cur.left while cur.left
    cur.left = tree.left
    reset(parent, tree, tree.right)
  end
  root
end

#TODO-remove: old' children
def reset(parent, old, neo)
  if parent.left == old
    parent.left = neo
  else
    parent.right = neo
  end
  old.left = old.right = nil
end

# NOTE: returned value is useful, maintain it
def delete_node(tree, key)
  return unless tree
  if tree.val == key
    if tree.left == nil
      return tree.right
    elsif tree.right == nil
      return tree.left
    else
      cur = tree.right
      cur = cur.left while cur.left
      cur.left = tree.left
      return tree.right
    end
  elsif tree.val > key
    tree.left = delete_node(tree.left, key)
  else
    tree.right = delete_node(tree.right, key)
  end
  tree
end