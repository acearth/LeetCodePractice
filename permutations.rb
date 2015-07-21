def permute(nums)
  result=[]
  dfs(nums, [], result)
  result
end

def dfs(nums, tmpNums, result)
  if nums.size<1
    result.push tmpNums
  else
    nums.each do |n|
      dfs(nums-[n], tmpNums+[n], result)
    end
  end
end


a=[1, 2, 3]
p permute a

