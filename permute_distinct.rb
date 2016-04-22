def permute(nums)
  return      [nums] if nums.size < 2
      permute(nums[0...-1]).flat_map { |line| 0.upto(line.size).map { |i| line.dup.insert(i, nums[-1]) } }
end
# Acknowledgement: Thanks to Chaoyang Che for improving my solution.
