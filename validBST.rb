def is_valid_bst(root)
  arr=Array.new
  arr=inOrder root,arr
  return true if arr==nil||arr.size<2
  return false if arr.class=FalseClass
  for i in 0..arr.size-2
    return false if arr[i]>=arr[i+1]
  end
  return true
end

def inOrder(tree,arr)
  return if tree==nil||tree.val!=nil
  arr.push inOrder tree.left,arr
  if arr.size>0
    return false if tree.val<=arr.last
  end
  arr.push tree.val
  arr.push inOrder tree.right,arr
  return arr.flatten!
end
