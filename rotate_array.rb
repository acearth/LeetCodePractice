##
#should do it in three different way.. 1) o(n) space 2)circular shifting by gcd(n,k) 3) my way
# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums, k)
  k=k%nums.length
  dlm=nums.length-k
  swap(nums,0,dlm-1)
  swap(nums,dlm,nums.length-1)
  swap(nums,0,nums.length-1)
#  p nums
end
def swap(nums,i,j)
  while i<j
    t=nums[i]
    nums[i]=nums[j]
    nums[j]=t
    i+=1
    j-=1
  end
end

nu=[1,2,3,4,5,6,7]
rotate nu,3



