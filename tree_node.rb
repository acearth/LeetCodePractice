# USAGE
# 1. generate by array, use '#' instead of nil node
#   the_tree = TreeNode.generate([1,'#',2,3,4]) # -->  1
#                                                       \
#                                                        2
#                                                       / \
#                                                      3   4
# 2. traverse
#   the_tree.pre_order #=> 1 2 3 4
#   the_tree.in_order  #=> 1 3 2 4

class TreeNode
  attr_accessor :val, :left, :right

  class << self
    def generate(arr)
      return if arr.empty?
      cur_level = []
      next_level = [root = TreeNode.new(arr.shift)]
      while arr.any?
        if cur_level.any?
          tree = cur_level.shift
          left = arr.shift
          right = arr.shift
          next_level << (tree.left = TreeNode.new(left)) if left && left != '#'
          next_level << (tree.right = TreeNode.new(right)) if right && right != '#'
        else
          cur_level = next_level
          next_level = []
        end
      end
      root
    end
  end

  def initialize(value, left = nil, right = nil)
    @val = value
    @left = left
    @right = right
  end

  def to_s
    # ": #{@val}"
    @val
  end

  def to_inspect
    @val
    # ": #{@val}"
  end

  def pre_order
    puts @val
    left.pre_order if left
    right.pre_order if right
  end

  def in_order
    left.in_order if left
    puts @val
    right.in_order if right
  end

  def inorder
    in_order
  end

  def post_order
    left.post_order if left
    right.post_order if right
    puts @val
  end

  def level_order
    queue = [self]
    while queue.size > 0
      tr = queue.shift
      queue << tr.left if tr.left
      queue << tr.right if tr.right
      puts tr.val
    end
  end
end
