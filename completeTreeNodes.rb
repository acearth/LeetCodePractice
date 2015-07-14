require './base/TreeNode'

def heightOfCompleteTree(root)
  return 0 if root==nil
  return 1+ heightOfCompleteTree(root.left)
end

def count_nodes(root)
  height=heightOfCompleteTree(root)
  return 0 if height==0
  h=2**(height-1)
  l=0
  while h-l>1
    m=(h+l)/2
    if checkNode(root, height, m)==true
      l=m+1
    else
      h=m
    end
    l-=1 if l==h
  end
  l-=1 if checkNode(root,height,l)==false
  return 2**(height-1)+l
end

def checkNode(root, height, seq)
  path=seq.to_s(2)
  d=height-1-path.length
  if d>0
    pre=String.new
    d.times do
      pre+="0"
    end
    path=pre+path
  end
  p=root
  (height-1).times do |i|
    if path[i]=="0"
      p=p.left
    else
      p=p.right
    end
    return false if p==nil&&i<height-1
  end
  return true
end

t1=TreeNode.new(1)
t2=TreeNode.new(2)
t3=TreeNode.new(3)
t4=TreeNode.new(4)
t5=TreeNode.new(5)
t6=TreeNode.new(6)
t7=TreeNode.new(7)
t1.left=t2
t1.right=t3
t2.left=t4
t2.right=t5
t3.left=t6
t3.right=t7
p count_nodes t1

