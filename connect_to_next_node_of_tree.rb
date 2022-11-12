# Q-116, 117 (116 is perfect tree)
# 
# Definition for Node.
# class Node
#     attr_accessor :val, :left, :right, :next
#     def initialize(val)
#         @val = val
#         @left, @right, @next = nil, nil, nil
#     end
# end

# @param {Node} root
# @return {Node}

# require './helper/tree_node'

def connect(root)
  leftmost = root
  while leftmost
    p = leftmost
    nextleft = nil
    while p
      p.left.next = p.right || firstkid(p.next) if p.left
      p.right.next = firstkid(p.next) if p.right
      nextleft ||= p.left || p.right
      p = p.next
    end
    leftmost = nextleft
  end
    puts root.to_s if root
  root
end

def firstkid(p)
  return unless p
  return (p.left || p.right) if p.left || p.right
  firstkid(p.next) # important
end
