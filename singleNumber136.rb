def single_number(nums)
  a=0
  nums.each{ |i| a^=i}
  a
end

nu=[1,2,3,2,1]
p single_number nu
