def build_tree(inorder, postorder)
  return unless inorder.any?
  root = TreeNode.new(postorder.last)
  root_index = inorder.index(root.val)
  root.left = build_tree(inorder[0...root_index], postorder[0...root_index])
  root.right = build_tree(inorder[root_index + 1..-1], postorder[root_index...-1])
  root
end