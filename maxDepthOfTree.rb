def max_depth(root)
  return getDepthOfTree(root,0)
end
def getDepthOfTree(tree,curDepth)
  if tree == nil
    return curDepth
  elsif tree.left==nil&&tree.right==nil
    return curDepth+1
  elsif tree.left==nil
    return getDepthOfTree(tree.right,curDepth+1)
  elsif tree.right==nil
    return getDepthOfTree(tree.left,curDepth+1)
  else
    dl=getDepthOfTree(tree.left,curDepth+1)
    dr=getDepthOfTree(tree.right,curDepth+1)
    if dl<dr
      return dr
    else
      return dl
    end
  end
end
