require './base/TreeNode'
def build_tree(inorder, postorder)
  return nil if inorder.size<1
  rtVal=postorder[-1]
  root=TreeNode.new(rtVal)
  rtIndex=inorder.find_index(rtVal)

  if rtIndex<1
    root.left=nil
  else
    stLenIn=inorder[0..rtIndex-1]
    stLenPost=postorder[0..rtIndex-1]
    root.left=build_tree(stLenIn, stLenPost)
  end
  if rtIndex>=inorder.size-1
    root.right=nil
  else
    stRightIn=inorder[rtIndex+1..inorder.size-1]
    stRightPost=postorder[rtIndex..postorder.size-2]
    root.right=build_tree(stRightIn, stRightPost)
  end
  return root
end

ain=[1,2]
apost=[2,1]

t=build_tree ain,apost
t.preOrder


