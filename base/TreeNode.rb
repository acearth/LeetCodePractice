class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val=val
    @left, @right=nil,nil
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
    self.left.preOrder
  end
  puts @val
  if self.right!=nil
    #preOrder self.right
    self.right.preOrder
  end
end
def postOrder
  if self.left!=nil
    #preOrder self.left
    self.left.preOrder
  end
  if self.right!=nil
    #preOrder self.right
    self.right.preOrder
  end
  puts @val
end

end

