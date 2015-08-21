require './base/TreeNode'

def recover_tree(root)
  p1=check(root)
  raise "No" if p1==nil
  p2=check(p1)
  (p1.val,p2.val=p2.val,p1.val;return ) if p2!=nil
  if p1.left==nil||p1.left.val<p1.val
    p1.val,p1.left.val=p1.left.val,p1.val
  else
    p1.val,p1.right.val=p1.right.val,p1.val
  end
  return  
end
def check(tree)
  return nil if tree==nil || tree.left==nil && tree.right==nil
  return tree if tree.left!=nil&& tree.val<tree.left.val
  return tree if tree.right!=nil&& tree.val<tree.right.val
  t=check(tree.left)
  return t if t!=nil
  check(tree.right)
end
t1=TreeNode.new(1)
t2=TreeNode.new(3)
t2.right=t1
recover_tree(t2)
