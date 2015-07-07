require './base/TreeNode'

def sorted_array_to_bst(nums)
  return if nums==nil||nums.size==0
  return TreeNode.new(nums[0]) if nums.size==1
  if nums.size==2
    rt=TreeNode.new(nums[1])
    rt.left=TreeNode.new(nums[0])
    return rt
  end
  h=nums.size
  m=h/2
  arr=TreeNode.new(nums[m])
  arr.left=sorted_array_to_bst(nums[0..m-1])
  arr.right=sorted_array_to_bst(nums[m+1..h-1])
  return arr
end
a=[1,2,3,4,5,6,7]
a=[1,2,3,4,5,6]
t=sorted_array_to_bst(a)
t.preOrder
puts
t.midOrder
