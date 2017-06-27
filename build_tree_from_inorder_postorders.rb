def build_tree(inorder, postorder)
    return if inorder.empty?
    root = TreeNode.new(postorder[-1])
    root_index = inorder.index(root.val)
    root.left = build_tree(inorder[0...root_index], postorder[0...root_index])
    root.right = build_tree(inorder[root_index + 1..-1], postorder[root_index..-2])
    root
en
