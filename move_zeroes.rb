def move_zeroes(nums)
  zc=0
  nums.each_with_index{|n,i| n==0 ? (zc+=1) : (nums[i-zc]=n)} ## i-zc is offset 
  (nums.size-zc).upto(nums.size-1){|i| nums[i]=0}
end
