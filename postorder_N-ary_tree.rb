# Q-590
# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

# @param {Node} root
# @return {List[int]}
def postorder(root)
  return [] unless root
  root.children.flat_map { |t| postorder(t) } + [root.val]
end
