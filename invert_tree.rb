def invert_tree_recur(root)
  return unless root
  invert_tree(root.left)
  invert_tree(root.right)
  root.left, root.right = root.right, root.left
  root
end

def invert_tree_level_order(root)
  return unless root
  q = [root]
  while q.any?
    q.map! do |t|
      t.left, t.right = t.right, t.left
      [t.left, t.right].compact
    end.flatten!
  end
  root
end

# preorder-way
def invert_tree(root)
  return unless root
  stack = [root]
  while stack.any?
    tree = stack.pop
    tree.left, tree.right = tree.right, tree.left
    stack << tree.right if tree.right
    stack << tree.left if tree.left
  end
  root
end