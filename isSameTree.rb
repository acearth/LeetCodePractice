def is_same_tree(p,q)

  if p==nil&&q==nil
    return true
  elsif p==nil&&q!=nil
    return false
  elsif p!=nil&&q==nil
    return false
  elsif p.val!=q.val
    return false
  elsif p.left==nil&&q.left==nil
    return is_same_tree(p.right,q.right)
  elsif p.right==nil&&q.right==nil
    return is_same_tree(p.left,q.left)
  elsif is_same_tree(p.left,q.left)&&is_same_tree(p.right,q.right)
    return true
  else
    return false
  end
end
