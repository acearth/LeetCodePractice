def longest_consecutive(nums)
  have=nums.map { |n| [n, true] }.to_h
  max_len=0
  have.each do |k, v|
    next if not v
    count=1
    upper, lower=k+1, k-1
    while have[upper]
      have[upper]=false
      upper, count=upper+1, count+1
    end
    while have[lower]
      have[lower]=false
      lower, count=lower-1, count+1
    end
    max_len=count if count>max_len
  end
  max_len
end
