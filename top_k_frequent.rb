def top_k_frequent(nums, k)
  freq = Hash.new { |h, k| h[k] = 0 }
  nums.each { |n| freq[n] += 1 }
  freq.sort_by { |_, v| v }.map { |k, _| k }.reverse[0...k]
end