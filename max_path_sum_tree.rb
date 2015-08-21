require './base/TreeNode'

def max_path_sum(root)
  m1,p1=get_max_path_and_root_to_leaf_path(root.left)
  m2,p2=get_max_path_and_root_to_leaf_path(root.right)
  tm=[]
  tm<<m1 if m1!=nil
  tm<<m2 if m2!=nil
  maxPath_without_root= tm.size==0 ? nil : tm.max
  maxPath_contains_root=root.val
  maxPath_contains_root+=p1 if p1!=nil && p1>0
  maxPath_contains_root+=p2 if p2!=nil && p2>0
  return maxPath_contains_root if maxPath_without_root ==nil
  [maxPath_contains_root, maxPath_without_root].max
end

def get_max_path_and_root_to_leaf_path(root)
  return [nil, nil] if root==nil
  m1,p1=get_max_path_and_root_to_leaf_path(root.left)
  m2,p2=get_max_path_and_root_to_leaf_path(root.right)
  tm=[]
  tm<<m1 if m1!=nil
  tm<<m2 if m2!=nil
  maxPath_without_root= tm.size==0 ? nil : tm.max
  maxPath_contains_root=root.val
  maxPath_contains_root+=p1 if p1!=nil && p1>0
  maxPath_contains_root+=p2 if p2!=nil && p2>0
  return [nil,maxPath_contains_root] if maxPath_without_root==nil
  [maxPath_without_root, maxPath_contains_root]
end

t1=TreeNode.new(1)
t2=TreeNode.new(2)
t3=TreeNode.new(3)
t1.left=t2
t1.right=t3
p max_path_sum(t1)
p max_path_sum(t2)
p max_path_sum(t3)
t4=TreeNode.new(-3)
p max_path_sum(t4)
t5=TreeNode.new(2)
t6=TreeNode.new(-1)
t5.left=t6
p max_path_sum(t5)

