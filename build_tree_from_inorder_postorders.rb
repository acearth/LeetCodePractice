def build_tree(inorder, postorder)
  return nil if inorder.size==0
  root=TreeNode.new(postorder[-1])
  index=inorder.index(root.val)
  root.left=build_tree(inorder[0...index], postorder[0...index])
  root.right=build_tree(inorder[index+1..-1],postorder[index..-2])
  root
end
