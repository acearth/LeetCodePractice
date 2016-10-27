class TreeNode
  attr_accessor :val, :left, :right
  class << self
    def generate(arr)
      return if arr.empty?
      cur_level = []
      next_level = [TreeNode.new(arr.shift)]
      root= next_level.first
      while arr.any?
        if cur_level.any?
          cur = cur_level.shift
          v = arr.shift
          cur.left = TreeNode.new(v) if v != '#'
          v = arr.shift if arr.any?
          cur.right = TreeNode.new(v) if v!='#'
          next_level << cur.left if cur.left
          next_level << cur.right if cur.right
        else
          cur_level=next_level
        end
      end
      root
    end
  end

  def initialize(value)
    @val = value
    @left, @right = nil, nil
  end

  def pre_order
    puts @val
    self.left.pre_order if self.left
    self.right.pre_order if self.right
  end

  def in_order
    self.left.in_order if self.left
    puts @val
    self.right.in_order if self.right
  end

  def post_order
    self.left.post_order if self.left
    self.right.post_order if self.right
    puts @val
  end

  def level_order
    queue = [self]
    while queue.size>0
      tr = queue.shift
      queue << tr.left if tr.left
      queue << tr.right if tr.right
      puts tr.val
    end
  end
end

