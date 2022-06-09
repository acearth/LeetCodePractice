# Q-90: remove dup in subsets
def subsets_with_dup(nums)
  result = []
  backtracking(nums.sort, 0, [], result)
  result
end

def backtracking(nums, start, collected, result)
  result << [] + collected
  (start...nums.size).each do |i|
    next if i > start && nums[i] == nums[i - 1]
    collected << nums[i]
    backtracking(nums, i + 1, collected, result)
    collected.pop
  end
end