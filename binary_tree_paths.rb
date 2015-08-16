require './base/TreeNode'
def binary_tree_paths(tree)
  result=[]
  return [] if tree==nil
  dfs(tree,tree.val.to_s,result)
  result
end

def dfs(tree,ancestors,result)
  result<<ancestors if tree.left==nil && tree.right==nil
  if tree.left!=nil
    neoAncestors=ancestors.dup+"->"+tree.left.val.to_s
    dfs(tree.left,neoAncestors,result)
  end
  if tree.right!=nil
    neoAncestors=ancestors.dup+"->"+tree.right.val.to_s
    dfs(tree.right,neoAncestors,result)
  end
end

t1=TreeNode.new(1)
t2=TreeNode.new(2)
t3=TreeNode.new(3)
t1.left=t2
t1.right=t3
p binary_tree_paths(t1)


