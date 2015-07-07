require './base/TreeNode'

def min_depth(root)
  return 0 if root==nil
  return 1 if root.left==nil&&root.right==nil
  if root.left==nil&&root.right!=nil
    return min_depth(root.right)+1
  elsif root.right==nil&&root.left!=nil
    return min_depth(root.left)+1
  end
  dl=min_depth root.left
  dr=min_depth root.right
  return [dl,dr].min+1
end

t1=TreeNode.new(1)
t2=TreeNode.new(2)
t1.left=t2

p min_depth(t1)


