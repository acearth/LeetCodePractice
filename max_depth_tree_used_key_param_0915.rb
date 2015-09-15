def max_depth(tree,cur=0)
  return cur if not tree
  dl=max_depth(tree.left,cur+1)
  dr=max_depth(tree.right,cur+1)
  dl>dr ? dl : dr
end
