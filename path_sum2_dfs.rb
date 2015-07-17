require './base/TreeNode'

def path_sum(root,sum)
  return [] if root==nil
  return [[root.val]] if root.val==sum&&root.left==nil&& root.right==nil
  result=Array.new
  dfs(root.left,[root.val],root.val,sum,result)
  dfs(root.right,[root.val],root.val,sum,result)
  result
end

def dfs(tree,tmpArr,curSum,sum,result)
  return if tree==nil
  result.push [tmpArr.dup,tree.val].flatten if tree.val+curSum==sum && tree.left==nil && tree.right==nil
  dfs(tree.left,[tmpArr.dup,tree.val].flatten, curSum+tree.val,sum,result)
  dfs(tree.right,[tmpArr.dup,tree.val].flatten, curSum+tree.val,sum,result)
end

t1=TreeNode.new(-2)
t2=TreeNode.new(-3)
t1.right=t2
p path_sum(t1,-5)

