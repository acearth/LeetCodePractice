def binary_tree_paths(tree, prefix = '')
  return [] unless tree
  return [prefix + tree.val.to_s] unless tree.left || tree.right
  binary_tree_paths(tree.left, prefix + "#{tree.val}->") + binary_tree_paths(tree.right, prefix + "#{tree.val}->")
end
