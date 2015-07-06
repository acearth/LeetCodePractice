require './base/TreeNode'

def inorder_traversal(root)
  ss=String.new
  st=Array.new
  ss=inOrderTrans(root)
  if ss!=nil
    st= ss.split
  else
    return []
  end
  std=Array.new
  st.size.times do |i|
    std[i]=st[i].to_i
  end
  return std
end

def inOrderTrans(tree)
  stNeo=String.new
  if tree==nil
    return stNeo
  end
  if tree.left!=nil
    stNeo+=inOrderTrans(tree.left)
  end
 stNeo+=tree.val.to_s+" "

  if tree.right!=nil
    stNeo+=inOrderTrans(tree.right)
  end
  return stNeo
end

t1=TreeNode.new(10)
t2=TreeNode.new(20)
t3=TreeNode.new(30)
t1.left=t2
t1.right=t3
p inorder_traversal(t1)

