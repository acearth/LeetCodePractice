def heightOf(tree)
 return 0 if tree ==nil
  leftH=heightOf(tree.left)
  rightH=heightOf(tree.right)
  if leftH>rightH
    return leftH+1
  else
    return rightH+1
  end
end


def is_balanced(root)
  return true if root==nil
  d=heightOf(root.left)-heightOf(root.right)
  if d.abs<2
    if is_balanced(root.left)&&is_balanced(root.right)
      return true
    end
  end
  return false
end

  
