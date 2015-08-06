def next_permutation(nums)
  max=nums[-1]
  (nums.size-2).downto(0) do |cur|
    if nums[cur]<max
      t,nums[cur]=nums[cur],max
      #put the one smallest but larger than nums[cur] to nums[cur]
      (cur+1).upto(nums.size-1){|i| nums[cur]=nums[i] if nums[i]>t&&nums[i]<nums[cur] }
      #delete the redunctant element 
      (cur+1).upto(nums.size-1){|i| (nums[i]=t;break) if nums[i]==nums[cur] }
      #sort the rest array by bubble sort
      (nums.size-2).downto(cur+1) do |j| 
        (cur+1).upto(j) do |i|
          nums[i],nums[i+1]=nums[i+1],nums[i] if nums[i]>nums[i+1]
        end
      end
      return
    else
      max=nums[cur]
    end
  end
  0.upto(-1+nums.size/2){|i| nums[i],nums[nums.size-i-1]=nums[nums.size-i-1],nums[i]}
  return
end
