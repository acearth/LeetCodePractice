# Q-47: permute remove dup by backtracking [dup-remove skill need review]
def permute_unique(nums)
  backtracking(nums.sort, [], [false] * nums.size, result = [])
  result
end

def backtracking(nums, got, visited, result)
  return result << [] + got if nums.size == got.size
  nums.each_with_index do |n, i|
    next if (i > 0 && n == nums[i - 1]) && visited[i - 1] || visited[i]
    visited[i] = true
    backtracking(nums, got + [n], visited, result)
    visited[i] = false
  end
end