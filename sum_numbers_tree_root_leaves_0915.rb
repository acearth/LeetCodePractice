def sum_numbers(root)
  result=[0]
  dfs(root,0,result)
  result[0]
end

def dfs(tree,curSum,result)
  return if tree==nil
  if tree.left==nil&&tree.right==nil
    result[0]+=curSum*10+tree.val
  else
    dfs(tree.left,curSum*10+tree.val,result)
    dfs(tree.right,curSum*10+tree.val,result)
  end
end
