def four_sum(nums, target)
  nums.sort!
  sum=Hash.new
  nums.each_with_index do |n, i|
    (i+1).upto(nums.size-1) do |j|
      curSum=n+nums[j]
      sum[curSum]=[] if !sum[curSum]
      sum[curSum].push [i, j]
    end
  end
  result=[]
  nums.each_with_index do |n, i|
    (i+1).upto(nums.size-3) do |j|
      expected=target-n-nums[j]
      if !sum[expected].nil?
        sum[expected].each { |k1, k2| result<<[n, nums[j], nums[k1], nums[k2]] if k1>j }
      end
    end
  end
  result.uniq
end

a=[1,0,-1,0,-2,2]
p four_sum(a,0)


