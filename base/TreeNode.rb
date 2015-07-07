class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val=val
    @left, @right=nil, nil
  end

  def preOrder
    puts @val
    if self.left!=nil
      #preOrder self.left
      self.left.preOrder
    end
    if self.right!=nil
      #preOrder self.right
      self.right.preOrder
    end
  end

  def midOrder
    if self.left!=nil
      #preOrder self.left
      self.left.midOrder
    end
    puts @val
    if self.right!=nil
      #preOrder self.right
      self.right.midOrder
    end
  end

  def postOrder
    if self.left!=nil
      #preOrder self.left
      self.left.postOrder
    end
    if self.right!=nil
      #preOrder self.right
      self.right.postOrder
    end
    puts @val
  end

  def levelOrder
    return if self==nil
    q=Array.new
    q.push self
    while q.size>0
      tr=q.shift
      q.push tr.left if tr.left!=nil
      q.push tr.right if tr.right!=nil
      puts tr.val
    end
  end

end



