require './base/TreeNode'

def flatten(root)
  return if root==nil
  s1, t1=flattenAct(root.left) if root.left!=nil
  s2, t2=flattenAct(root.right) if root.right!=nil
  root.left=nil
  if s1!=nil
    root.right=s1
    t1.right=s2 if s2!=nil
  elsif s2!=nil
    root.right=s2
  end
  return
end

def flattenAct(root)
  if root.left==nil&&root.right==nil
    tail=root
  elsif root.left!=nil&&root.right==nil
    s1, t1=flattenAct(root.left)
    root.right=s1
    tail=t1
  elsif root.left==nil&&root.right!=nil
    s2, t2=flattenAct(root.right)
    root.right=s2
    tail=t2
  elsif root.left!=nil&&root.right!=nil
    s1, t1=flattenAct(root.left)
    s2, t2=flattenAct(root.right)
    root.right=s1
    t1.right=s2
    tail=t2
  end
  root.left=nil
  return root, tail
end

t1=TreeNode.new(1)
t2=TreeNode.new(2)
t1.left=t2

flatten(t1)



