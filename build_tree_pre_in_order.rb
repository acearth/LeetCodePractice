def build_tree(preorder, inorder)
  return unless preorder.any?
  root = TreeNode.new(preorder.first)
  index = inorder.index(root.val)
  root.left = build_tree(preorder[1..index], inorder[0...index])
  root.right = build_tree(preorder[index + 1..-1], inorder[index + 1..-1])
  root
end