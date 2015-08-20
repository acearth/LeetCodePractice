require './base/TreeNode'

def sorted_array_to_bst(nums)
  return nil if nums.size==0
  m=nums.size/2
  arr=TreeNode.new(nums[m])
  arr.left=sorted_array_to_bst(nums[0...m])
  arr.right=sorted_array_to_bst(nums[m+1..-1])
  return arr
end
a=[1,2,3,4,5,6,7]
a=[1,2,3,4,5,6]
t=sorted_array_to_bst(a)
t.preOrder
puts
t.midOrder
