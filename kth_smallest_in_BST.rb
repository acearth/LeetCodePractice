require './base/TreeNode'

def kth_smallest(root, k)
  visitedSize=[0]
  return in_order(root, visitedSize, k)
end

def in_order(tree, visitedSize, kth)
  va=in_order(tree.left, visitedSize, kth) if tree.left!=nil
  return va if va!=nil
  visitedSize[0]+=1
  return tree.val if visitedSize[0]==kth
  vb=in_order(tree.right, visitedSize, kth) if tree.right!=nil
  return vb if vb!=nil
end
t1=TreeNode.new(1)
t2=TreeNode.new(2)
t3=TreeNode.new(3)
t4=TreeNode.new(4)
t5=TreeNode.new(5)
t6=TreeNode.new(6)
t7=TreeNode.new(7)
t8=TreeNode.new(8)
t5.left=t3
t5.right=t7
t3.left=t1
t3.right=t4
t1.right=t2
t7.left=t6
t7.right=t8

8.times do |i|
  puts "#{i+1}  #{kth_smallest(t5,i+1)}"
end


