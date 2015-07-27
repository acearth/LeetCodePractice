def contains_nearby_duplicate(nums, k)
  return nums.size!=nums.uniq.size if k+1>=nums.size
  hash=Hash.new
  (0..k).each{|i| hash[nums[i]]=true}
  return true if hash.size<k+1
  for i in 0..nums.size-k-1
    hash.delete(nums[i])
    hash[nums[i+k+1]]=true
    return true if hash.size<k+1
  end
  return false
end

a=1,3,2,3,4,5,6
p contains_nearby_duplicate(a,2)
p contains_nearby_duplicate(a,3)
p contains_nearby_duplicate(a,1)
a=-1,-1
p contains_nearby_duplicate a,1

