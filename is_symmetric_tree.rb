def is_symmetric(root)
  return true if root==nil
  is_symmetric_part(root.left,root.right)
end

def is_symmetric_part(left,right)
  return left==nil if right==nil
  return right==nil if left==nil
  return false if left.val!=right.val
  is_symmetric_part(left.left, right.right) && is_symmetric_part(left.right, right.left)
end
