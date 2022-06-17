# Q-450
def remove(tree)
  return unless tree
  return tree.left if !tree.right
  return tree.right if !tree.left
  root = tree.right
  p = tree.left
  p = p.right while p && p.right
  p.right = root.left
  root.left = tree.left
  root
end

def delete_node_recursive(tree, val)
  return unless tree
  if tree.val == val
    return remove(tree)
  elsif tree.val > val
    tree.left = delete_node(tree.left, val)
  else
    tree.right = delete_node(tree.right, val)
  end
  tree
end

def delete_node_iterate(tree, val)
  return unless tree
  return remove(tree) if tree.val == val
  pre = p = tree
  while p
    if p.val == val
      if pre.left == p
        pre.left = remove(p)
      else
        pre.right = remove(p)
      end
      break
    elsif p.val > val
      pre = p
      p = p.left
    else
      pre = p
      p = p.right
    end
  end
  tree
end