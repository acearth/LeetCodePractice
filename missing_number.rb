def missing_number(nums)
  (1..nums.size).reduce(:^) ^ nums.reduce(:^)
end
