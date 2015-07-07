def remove_duplicates(nums)
  return 0 if nums==nil||nums.size==0
  return 1 if nums.size==1
  len=nums.length
  v0=nums[0]
  cur=1
  bCur=0
  while cur<len
    if nums[bCur]==nums[cur]
      cur+=1
    else
      bCur+=1
      nums[bCur]=nums[cur]
      cur+=1
    end
  end
  return bCur+1
end

ar=[1,2,3]
p remove_duplicates(ar)
ab=[1,1,2]
p remove_duplicates(ab)

