def contains_duplicate(nums)
  has=Hash.new
  nums.each{|n| return true if has[n]; has[n]=true}
  false
end

p contains_duplicate([1,2,3,3])
