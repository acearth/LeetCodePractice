# Q-337: rob game in binary tree
# IF solving by DP, need to set dp table [taken, noken_value] for each node
# Directly by post-order recursive way with memoization is enough
def rob(root)
  robp(root, {})
end

# rob with parentinfo
def robp(root, dp)
  return dp[root] if dp[root]
  if !root
    return 0
  elsif !root.left && !root.right
    dp[root] = root.val
  else
    left_got = robp(root.left, dp)
    right_got = robp(root.right, dp)
    left_kids = robp(root.left&.left, dp) + robp(root.left&.right, dp)
    right_kids = robp(root.right&.left, dp) + robp(root.right&.right, dp)
    dp[root] = [left_got + right_got, root.val + left_kids + right_kids].max
  end
end
