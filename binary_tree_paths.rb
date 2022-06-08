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
  return [] unless root
  stack, paths, result = [root], [[root.val]], []
  while stack.any?
    tree, path = stack.pop, paths.pop
    if tree.right
      stack << tree.right
      paths << path + [tree.right.val]
    end
    if tree.left
      stack << tree.left
      paths << path + [tree.left.val]
    end
    result << path.join('->') unless tree.left || tree.right
  end
  result
end

def binary_tree_paths_backtracking(root)
  result = []
  back(root, [root.val], result)
  result
end

def back(root, path, result)
  result << path.join('->') unless root.left || root.right
  if root.left
    path << root.left.val
    back(root.left, path, result)
    path.pop
  end
  if root.right
    path << root.right.val
    back(root.right, path, result)
    path.pop
  end
end

def binary_tree_paths_recur(tree)
  path(tree).map { |p| p.join("->") }
end

def path(tree)
  return [] unless tree
  return [[tree.val]] if !tree.left && !tree.right
  (path(tree.left) + path(tree.right)).map { |p| [tree.val] + p }
end