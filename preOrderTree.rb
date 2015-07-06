require "./base/TreeNode"

def preorder_traversal(root)
  st=String.new
  st=preOrderTree(root, st)
  st=st.split
  std=Array.new
  st.size.times do |i|
    std[i]=st[i].to_i
  end
  return std
end

def preOrderTree(tr, st)
  if tr==nil
    return st
  else
    st+=(tr.val.to_s+" ")
  end
  if tr.left!=nil
    st=preOrderTree(tr.left, st)
  end
  if tr.right!=nil
    st=preOrderTree(tr.right, st)
  end
  return st
end

t1=TreeNode.new(10)
t2=TreeNode.new(20)
t3=TreeNode.new(30)
t1.left=t2
t1.right=t3

p preorder_traversal(t1)

