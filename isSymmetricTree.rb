require './base/TreeNode'

def is_symmetric(root)
  return true if root==nil||(root.left==nil&&root.right==nil)
  q=Array.new
  qq=Array.new
  q.push root
  loop do
    while q.size>0
      tr=q.shift
      add_queue(tr,qq)
    end
    return false if !isMirror(qq.dup)
    break if isFinished(qq)
    q=qq.dup
    qq.clear
  end
  return true
end
def isFinished(arr)
  t=0
  arr.each{|e| t+=1 if e.val=='#'}
  return t==arr.size
end

def add_queue(tree,queue)
  return if tree.val=='#'
  queue.push tree.left==nil ? TreeNode.new('#') : tree.left
  queue.push tree.right==nil ? TreeNode.new('#') : tree.right
end
def isMirror(arr)
  loop do
    a1=arr.shift
    a2=arr.pop
    break if a1==nil||a2==nil
    return false if a1.val!=a2.val
  end
  return true
end

t1=TreeNode.new(1)
t2=TreeNode.new(2)
t3=TreeNode.new(2)
t1.left=t2
t1.right=t3
p is_symmetric t1

