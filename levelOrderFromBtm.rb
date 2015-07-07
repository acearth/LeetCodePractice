# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[][]}
def level_order_bottom(root)
  return [] if root ==nil
  ta=Array.new
  tb=Array.new
  qu=Array.new
  qu.push root
  while true
    tal=Array.new
    que=Array.new
    while qu.size>0
      tr=qu.shift
      que.push tr.left if tr.left!=nil
      que.push tr.right if tr.right !=nil
      tal.push tr.val
    end
    qu=que
    ta.unshift tal
    break if que.size==0
  end
  return ta

end
