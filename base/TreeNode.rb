class TreeNode
  attr_accessor :val, :left, :right

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

