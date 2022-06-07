def binary_tree_paths_recursive(tree)
  path(tree).map { |p| p.join("->") }
end

def path(tree)
  return [] unless tree
  return [[tree.val]] unless tree.left || tree.right
  (path(tree.left) + path(tree.right)).map { |p| [tree.val] + p }
end

# Q-257 with preorder traversal:
# (1) companion- paths stack for collecting path, sync with stack
# (2) note for output condition (leaf rather than nil)
def binary_tree_paths(root)
  paths, stack, result = [[root.val]], [root], []
  while stack.any?
    tree, path = stack.pop, paths.pop
    result << path.join('->') if !tree.left && !tree.right
    if tree.right
      stack << tree.right
      paths << path + [tree.right.val]
    end
    if tree.left
      stack << tree.left
      paths << path + [tree.left.val]
    end
  end
  result
end