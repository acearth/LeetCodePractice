# Q-491: find sequences with hash-remove-dup
def find_subsequences(nums)
  result = []
  backtracking(nums, 0, [-1 * 2 ** 32], result)
  result
end

# considered one series: [4,7,6,7], we cannot use `i > start && nums[i] == nums[i - 1]` for skip
# Since all elements ranges in (-100..100), we could use an array to instead hash for recording
# used elements in SAME LEVEL
def backtracking(nums, start, collected, result)
  result << collected[1..-1] if collected.size > 2
  (start...nums.size).each_with_object([]) do |i, used|
    next if nums[i] < collected.last || used[nums[i] + 100]
    used[nums[i] + 100] = true
    collected << nums[i]
    backtracking(nums, i + 1, collected, result)
    collected.pop
  end
end
