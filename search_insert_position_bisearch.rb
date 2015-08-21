def search_insert(nums, target)
  l,r=0,nums.size
  while l<r
    m=(l+r)/2
    return m if target==nums[m]
    r=m if nums[m]>target
    l=m+1 if nums[m]<target
  end
  l
end
