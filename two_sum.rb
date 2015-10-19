def two_sum(nums, target)
  has={}
  nums.each_with_index{|n,i| has[target-n] ? (return [has[target-n],i+1]) : (has[n]=i+1) }
end
