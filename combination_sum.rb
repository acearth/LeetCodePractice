# Q-39: output without unique and sort
def combination_sum(candidates, target)
  result = []
  backtracking(candidates, 0, [], target, result)
  result
end

# NOTE: the start is accessible again
def backtracking(candidates, start, collected, target, result)
  return (result << [] + collected if target == 0) if target <= 0
  (start...candidates.size).each do |i|
    collected << candidates[i]
    backtracking(candidates, i, collected, target - candidates[i], result)
    collected.pop
  end
end