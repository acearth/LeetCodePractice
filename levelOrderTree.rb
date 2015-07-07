require './base/TreeNode'

def level_order(root)
  return [] if root ==nil
  ta=Array.new
  tb=Array.new
  qu=Array.new
  qu.push root
  while true
    tal=Array.new
    que=Array.new
    while qu.size>0
      tr=qu.shift
      que.push tr.left if tr.left!=nil
      que.push tr.right if tr.right !=nil
      tal.push tr.val
    end
    qu=que
    ta.push tal
    break if que.size==0
  end
  return ta

end


t1=TreeNode.new(1)
t2=TreeNode.new(2)
t3=TreeNode.new(3)
t4=TreeNode.new(4)
t5=TreeNode.new(5)
t1.left=t2
t1.right=t3
t2.left=t4
t3.left=t5

t1.preOrder
puts
t1.midOrder

puts
p level_order(t1)

