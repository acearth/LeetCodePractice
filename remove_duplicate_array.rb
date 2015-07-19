def remove_duplicates(nums)
  return nums.size if nums.size<3
  baseCur=0
  cur=0
  nums.push nil
  while cur<nums.size-1
    cur=getNextPosition(nums,cur,baseCur)
    baseCur+=1
    nums[baseCur]=nums[cur]
  end
  baseCur
end
def getNextPosition(nums,cur,baseCur)
  return cur+1 if nums[cur]!=nums[cur+1]
  preEqual= nums[baseCur]==nums[baseCur-1]
  while nums[cur]==nums[cur+1]
    cur+=1
  end
  return cur+1 if preEqual
  return cur
end

a=[1,1,2]
p remove_duplicates a
a=[1,1,1,2,2,3]
p remove_duplicates a

