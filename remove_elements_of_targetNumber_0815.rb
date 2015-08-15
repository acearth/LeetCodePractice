def remove_element(nums, value)
  right=nums.size-1
  nums.each_with_index do |n, i|
    if n==value
      while nums[right]==value&& right>i
        right-=1
      end
      break if right<i
      nums[i]=nums[right]
      right-=1
    end
  end
  right+1
end

