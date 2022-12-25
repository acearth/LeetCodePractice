# Q-337: rob in a binary tree
# DP and memoize-solution
#
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}
def rob(root)
  memo = Hash.new { |h, k| h[k] = {} }
  [memo_helper(root, false, memo), memo_helper(root, true, memo)].max
end

def memo_helper(root, take, memo)
  return 0 unless root
  return memo[root][take] if memo[root][take]
  if take
    memo[root][take] = root.val + memo_helper(root.left, false, memo) + memo_helper(root.right, false, memo)
  else
    memo[root][take] = [[true, true], [true, false], [false, true], [false, false]].map do |l, r|
      memo_helper(root.left, l, memo) + memo_helper(root.right, r, memo)
    end.max
  end
end

def rob(root)
  dp(root).max
end

def dp(root)
  # [contains root, NOT contains root]
  return [0, 0] unless root
  l = dp(root.left)
  r = dp(root.right)
  [root.val + l[1] + r[1], r.max + l.max]
end