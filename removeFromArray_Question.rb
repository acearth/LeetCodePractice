def remove_element(nums,value)
  len=nums.length
  k1=0
  k2=len-1
  while true
    while(k1<len)
      if nums[k1]==value
        break
      end
    end
    while k2>-1
      if nums[k2]!=value
        break
      else
        nums[k2]=nil
      end
    end
    if k1>k2
      break
    else
      nums[k1]=nums[k2]
      for r in k2..len
        nums[r]=nums[r+1]
      end
    end
  end
end

arr=[1,2,2,3,2,2,1]
remove_element(arr,2)
p arr
    
