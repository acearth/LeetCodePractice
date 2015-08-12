def sort_colors(nums)
  f, t=0, nums.size-1
  k=0
  while k<=t
    if nums[k]==0
      nums[k], nums[f]=nums[f], nums[k]
      f+=1
    elsif nums[k]==2
      nums[k], nums[t]=nums[t], nums[k]
      t-=1
      k-=1 ##important! The new nums[k] is unchecked, so need to check again
    end
    k+=1
  end
end
