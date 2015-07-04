#ram {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
 pro=Hash.new
  nums.length.times do|i|
    pro[nums[i]]=i+1
  end
  nums.length.times do|i|
    k=target-nums[i]
    if nums.include? k
      if(i+1 != pro[k])
        return [i+1,pro[k]]
      end
    end
  end
end
