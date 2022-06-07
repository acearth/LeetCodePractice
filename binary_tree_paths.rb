def binary_tree_paths(tree)
  path(tree).map { |p| p.join("->") }
end

def path(tree)
  return [] unless tree
  return [[tree.val]] unless tree.left || tree.right
  (path(tree.left) + path(tree.right)).map { |p| [tree.val] + p }
end

