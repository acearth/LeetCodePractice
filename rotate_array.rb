# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums,k)
  k=nums.length - k%nums.length
  reverse(nums,0,k)
  reverse(nums,k,nums.length)
  reverse(nums,0,nums.length)
end

def reverse(arr,p,r)
  (r-p>>1).times do |i|
    arr[p+i], arr[r-1-i]=arr[r-1-i], arr[p+i]
  end
end
