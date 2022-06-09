def combination_sum2(candidates, target)
  result = []
  backtracking(candidates.sort, 0, [], target, result)
  result.uniq
end

# @note: (1) remove duplicates; (2) prune ASAP, fails if prune on return condition
def backtracking(candidates, start, path, target, result)
  return result << [] + path if target == 0 #@note: diff here
  (start...candidates.size).each do |i|
    # note: slide by when i > start, rather than i > 0, since we need to enter at least once!
    next if i > start && candidates[i] == candidates[i - 1] && candidates[i - 1] == candidates[i - 2]
    break if target - candidates[i] < 0 # @note: eagerly pruned;  diff here
    path << candidates[i]
    backtracking(candidates, i + 1, path, target - candidates[i], result)
    path.pop
  end
end