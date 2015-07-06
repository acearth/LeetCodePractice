require "./base/TreeNode"

def postorder_traversal(root)
  st=String.new
  st=postOrderTree(root, st)
  if st==nil
    return []
  end
  st=st.split
  std=Array.new
  st.size.times do |i|
    std[i]=st[i].to_i
  end
  return std
end

def postOrderTree(tr, st)
  if tr==nil
    return nil
  end
  if tr.left!=nil
    st=postOrderTree(tr.left, st)
  end
  if tr.right!=nil
    st=postOrderTree(tr.right, st)
  end
  if tr==nil
    return st
  else
    st+=(tr.val.to_s+" ")
  end
  return st
end

t1=TreeNode.new(10)
t2=TreeNode.new(20)
t3=TreeNode.new(30)
t1.left=t2
t1.right=t3

p postorder_traversal(t1)

