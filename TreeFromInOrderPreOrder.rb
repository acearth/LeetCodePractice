require './base/TreeNode'

def build_tree(preorder,inorder)
  return nil if preorder.size<1
  rtVal=preorder[0]
  root=TreeNode.new(rtVal)
  rtIndex=inorder.find_index(rtVal)

  if rtIndex<1
    root.left=nil
  else
    stLeftIn=inorder[0..rtIndex-1]
    stLeftPre=preorder[1..rtIndex]
    root.left=build_tree(stLeftPre,stLeftIn)
  end

  if rtIndex>=inorder.size-1
    root.right=nil
  else
    stRightIn=inorder[rtIndex+1..inorder.size-1]
    stRightPre=preorder[rtIndex+1..preorder.size-1]
    root.right=build_tree(stRightPre,stRightIn)
  end

  return root
end
apre=[1, 2, 4, 5, 3, 6, 7]
ain =[4, 2, 5, 1, 6, 3, 7]

#t=build_tree(apre,ain)
#t.postOrder
t=build_tree([],[])
#t.postOrder



