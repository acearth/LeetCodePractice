require './base/TreeNode'
class BSTIterator
  def initialize(root)
    @stack=Array.new
    while root!=nil
      @stack.push root
      root=root.left
    end
  end

  def has_next
    @stack.size>0
  end

  def next
    nextNode=@stack.pop
    p=nextNode.right
    while p!=nil
      @stack.push p
      p=p.left
    end
    nextNode.val
  end
end
t1=TreeNode.new(1)
t2=TreeNode.new(2)
t3=TreeNode.new(3)
t2.left=t1
t2.right=t3
iter=BSTIterator.new(t2)
while iter.has_next
  p iter.next
end
