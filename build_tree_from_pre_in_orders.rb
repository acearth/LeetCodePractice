def build_tree(preorder,inorder)
  return nil if preorder.size==0
  tree=TreeNode.new(preorder[0])
  index=inorder.index(preorder[0])
  tree.left=build_tree( preorder[1..index],inorder[0...index] )
  tree.right=build_tree(preorder[index+1..-1],inorder[index+1..-1])
  tree
end
