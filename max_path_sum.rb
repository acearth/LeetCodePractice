def max_path_sum(root)
  max_path(root).max
end

def max_path(tree)
  return [-1 * 2**31]*2 if tree==nil
  left=max_path(tree.left)
  right=max_path(tree.right)
  m1=[left[0], right[0], 0].max  # deal with negative
  m2=(left + right + [tree.val+left[0]+right[0]]).max
  [tree.val+m1, m2]
end
