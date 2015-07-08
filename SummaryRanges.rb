# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
  res=Array.new
  return res if nums==nil||nums.size<1
  if nums.size==1
    res.push nums[0].to_s
    return res
  end
  pre=nums[0]
  curE=pre
  len=nums.size
  for i in 1..len-1 do
    if curE+1==nums[i]
      curE+=1
    else
      addString(res,pre,curE)
      pre=nums[i]
      curE=pre
    end
  end
  if nums[len-1]-nums[len-2]==1
    addString(res,pre,nums[len-1])
  else
    addString(res,nums[len-1],nums[len-1])
end
return res
end

def addString(st, k1, k2)
  if k1==k2
    st.push k1.to_s
  else
    st.push k1.to_s+"->"+k2.to_s
  end
end

ar=[1, 3]
p summary_ranges ar
ar=[2, 3]
p summary_ranges ar
ar=[2, 3, 4, 6]
p summary_ranges ar
ar=[0, 5, 9]
p summary_ranges ar

