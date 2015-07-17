def has_path_sum(root, sum)
  resultTree=TreeNode.new(0)
  dfs(root,0,sum,resultTree)
  return resultTree.val!=0
end
def dfs(tree,curSum,sum,result)
  return if tree==nil
  result.val+=1 if curSum+tree.val==sum&&tree.left==nil&&tree.right==nil
  dfs(tree.left,curSum+tree.val,sum,result)
  dfs(tree.right,curSum+tree.val,sum,result)
end
