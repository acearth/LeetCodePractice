def search_range(nums,target)
  result=bisearch(nums,0,nums.size,target)
  l=h=result
  return [l,h] if result==-1
  while h<nums.size && nums[h]==target
    h+=1
  end
  while l>=0 && nums[l]==target 
    l-=1
  end
  [l+1,h-1]
end

def bisearch(arr,l,h,target)
  return -1 if l==h
  m=(l+h)/2
  return m if arr[m]==target
  if target>arr[m]
    return bisearch(arr,m+1,h,target)
  else
    return bisearch(arr,l,m,target)
  end
end
a=1,2,3,4,5
p bisearch a,0,5,0
p bisearch a,0,5,1
p bisearch a,0,5,2
p bisearch a,0,5,3
p bisearch a,0,5,4
p bisearch a,0,5,5
p bisearch a,0,5,6

b=1,2,2,3,3,3,4
p search_range b,2
p search_range b,3
p search_range b,0
