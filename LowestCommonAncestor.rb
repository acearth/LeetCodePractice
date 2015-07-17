# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
    sta=root.val<=>p.val
    stb=root.val<=>q.val
    return root if sta!=stb
    if sta>0
        return lowest_common_ancestor(root.left,p,q)
    else
     return lowest_common_ancestor(root.right,p,q)
 end
end
