def combination_sum2(candidates, target)
  result=Array.new
  dfs(candidates, Array.new, 0, target, result)
  result.sort!
  result.uniq #Should I use uniq methed or implement this method?
end

def dfs(nums, tmpNums, curSum, target, result)
  for i in 0..nums.size-1
    if target==curSum+nums[i]
      tmpNumsNew=tmpNums.dup
      tmpNumsNew.push nums[i]
      result.push tmpNumsNew.sort
    elsif target>curSum+nums[i]
      tmpNumsNew=tmpNums.dup
      tmpNumsNew.push nums[i]
      break if i==nums.size-1
      dfs(nums[i+1..-1], tmpNumsNew, curSum+nums[i], target, result)
    end
  end
end

ar=2, 3, 6, 7
p combination_sum ar, 7
ar=[8, 7, 4, 3]
p combination_sum ar, 11
ar=10, 1, 2, 7, 6, 1, 5
p combination_sum ar, 8
