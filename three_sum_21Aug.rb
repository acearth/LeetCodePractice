def three_sum(nums)
  nums.sort!
  len=nums.size
  result=[]
  (len-2).times do |i|
    if i==0 || i>0&&nums[i]!=nums[i-1]
      low, high=i+1, len-1
      while low<high
        t=nums[low]+nums[high]+nums[i]
        if t==0
          result<<[nums[i], nums[low], nums[high]]
          low+=1 while nums[low]==nums[low+1] &&low<high
          high-=1 while nums[high]==nums[high-1] &&low<high
          low, high=low+1, high-1
        elsif t>0
          high-=1
        else
          low+=1
        end
      end
    end
  end
  result
end

ar=-1, 0, 1, 2, -1, -4
p three_sum ar

