# Acknowledgement: Thanks to Chaoyang Che for improving my solution.
def permute_trick(nums)
  return [nums] if nums.size < 2
  permute(nums[0...-1]).flat_map { |line| 0.upto(line.size).map { |i| line.dup.insert(i, nums[-1]) } }
end

# Q-46: @note: use visited hash. Reset after tracked.
def permute(nums)
  backtracking(nums, [], nums.zip([false] * nums.size).to_h, result = [])
  result
end

def backtracking(nums, got, visited, result)
  return result << [] + got if got.size == nums.size
  nums.each do |n|
    next if visited[n]
    got << n
    visited[n] = true
    backtracking(nums, got, visited, result)
    got.pop
    visited[n] = false
  end
end

p permute([1, 2, 3])
