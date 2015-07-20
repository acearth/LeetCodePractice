def combination_sum(candidates, target)
  result=Array.new
  dfs(candidates, Array.new, 0, target, result)
  result.each {|re| re.sort!}
  result.sort
end

def dfs(nums, tmpNums, curSum, target, result)
  if target==curSum
    result.push tmpNums
    return
  else
    for i in 0..nums.size-1
      if target>=curSum+nums[i]
        tmpNumsNew=tmpNums.dup
        tmpNumsNew.push nums[i]
        dfs(nums[i..-1], tmpNumsNew, curSum+nums[i], target, result)
      end
    end
  end
end

ar=2, 3, 6, 7
p combination_sum ar, 7
ar=[8,7,4,3]
p combination_sum ar, 11

