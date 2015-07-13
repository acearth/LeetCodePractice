# attention corner

def min_sub_array_len(s,nums)
  sum=0
  st=0
  cur=0
  len=nums.length+1
  while true
    while sum<s&&cur<nums.size
      sum+=nums[cur]
      cur+=1
    end
    break if sum<s
    len=[len,cur-st].min
    sum-=nums[st]
    st+=1
  end
  
  return 0 if len>nums.size
  return len
end
