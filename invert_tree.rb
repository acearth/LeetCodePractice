require './TreeNode'

f1=TreeNode.new(10)
f2=TreeNode.new 20
f3=TreeNode.new 30
f4=TreeNode.new 40
f5=TreeNode.new 50
f6=TreeNode.new 60
f7=TreeNode.new 70

f1.left=f2
f1.right=f3
f2.left=f4
f2.right=f5
f3.left=f6
f3.right=f7
#
#def preOrder(t)
#  if t.left!=nil
#    preOrder(t.left)
#  end
#  if t.right!=nil
#    preOrder(t.right)
#  end
#  p t.val
#end
f1.preOrder
puts
f1.midOrder
puts
f1.postOrder
def invert_tree(root)
  if root==nil
    return
  else
    tmp=root.left
    root.left=root.right
    root.right=tmp
    invert_tree(root.left)
    invert_tree(root.right)
  end
  return root
end
invert_tree(f1)
f1.preOrder
puts
f1.midOrder
puts
f1.postOrder

