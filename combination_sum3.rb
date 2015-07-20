def combination_sum3(k,target)
  result=Hash.new
  dfs([1,2,3,4,5,6,7,8,9], Array.new, 0, target, result)
  res=Array.new
  result.each{|key,v| res.push key if v==true&&key.size==k}
  res.sort
end

def dfs(nums, tmpNums, curSum, target, result)
  for i in 0..nums.size-1
    if target==curSum+nums[i]
      tmpNumsNew=tmpNums.dup
      tmpNumsNew.push nums[i]
      result[tmpNumsNew.sort]=true
    elsif target>curSum+nums[i]
      tmpNumsNew=tmpNums.dup
      tmpNumsNew.push nums[i]
      break if i==nums.size-1
      dfs(nums[i+1..-1], tmpNumsNew, curSum+nums[i], target, result)
    end
  end
end

ar=2, 3, 6, 7
p combination_sum3  3,7
ar=[8, 7, 4, 3]
p combination_sum3  3,11
ar=10, 1, 2, 7, 6, 1, 5
p combination_sum3  3,8
