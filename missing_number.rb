def missing_number(nums)
  #(1..nums.size).inject(:^) ^ (nums.inject(:^))
  #(1..nums.size).reduce(:^) ^ nums.reduce(:^)
  nums.each_with_index.map{|n,i| n^(i+1)}.inject{|result,i| result^=i }
end
