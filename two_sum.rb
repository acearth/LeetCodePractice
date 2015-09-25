#  1. If a+b =target, we call b is partner of a.
#  2. We allocate a hash table, hash[k] records the partner index of k.
#  3. Let's visit the array, if hash[ei] exists, means ei and the partner of ei both exists in array. So we just return it.
#  4. Any more?  Because there exists and only exists one result, so we needn't to do  anything out of loop body.
#  Arthur:Arthur(Xq.AN)

def two_sum(nums, target)
  hash = Hash.new
  nums.each_with_index do |n,i|
    return [hash[n], i + 1] if hash[n]
    hash[target - n] = i + 1
  end
end
