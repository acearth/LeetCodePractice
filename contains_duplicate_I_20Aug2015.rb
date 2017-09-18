def contains_duplicate(nums)
  has = {}
  nums.each{|n| return true if has[n]; has[n] = true}
  false
end
