def sum_numbers(root)
  resultTree=TreeNode.new(0)
  dfs(root,0,resultTree)
  resultTree.val
end

def dfs(tree,curSum,resultTree)
  return if tree==nil
  if tree.left==nil&&tree.right==nil
    resultTree.val+=curSum*10+tree.val
    return
  else
    dfs(tree.left,curSum*10+tree.val,resultTree)
    dfs(tree.right,curSum*10+tree.val,resultTree)
  end
end

  

