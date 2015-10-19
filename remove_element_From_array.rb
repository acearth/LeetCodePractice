def remove_element(nums, val)
  cleard=-1
  nums.each_with_index do |n,i|
    if val!=n
      cleard+=1
      nums[cleard]=n
    end
  end
  cleard+1
end
