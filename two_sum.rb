def two_sum(nums, target)
  have={}
  nums.each_with_index{|n,i| have[target-n] ? (return [have[target-n],i+1]) : (have[n]=i+1) }
end
