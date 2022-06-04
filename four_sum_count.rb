def four_sum_count(nums1, nums2, nums3, nums4)
  sum, result = Hash.new { |h, k| h[k] = [] }, 0
  nums1.each_with_index do |n, i|
    nums2.each_with_index do |m, j|
      sum[n + m] << [i, j]
    end
  end
  nums3.each_with_index do |n, i|
    nums4.each_with_index do |m, j|
      result += sum[-m - n].size
    end
  end
  result
end