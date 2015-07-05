def find_peak_element(nums)
  h=nums.length-1
  m=nums.length/2
  if nums[0]>nums[1]
    return 0
  elsif nums[h]>nums[h-1]
    return h
  else

  
  
end

  
  
  
  
def lookAround(arr,n)
    if arr[n]>arr[n-1]&&arr[n]>arr[n+1]
      return true
    else
      return false
    end
end



