# This method can be implemented at least in 6 ways in O(n) time.

# Way 1: answer = current sum - minimum sum got
def max_sub_array(nums)
  answer = sum = min_sum = nums[0]
  min_sum = 0 if nums[0] > 0
  nums[1..-1].each do |n|
    sum += n
    answer = [ answer, sum - min_sum ].max
    min_sum = sum if sum < min_sum
  end
  answer
end

# Way 2: optimized dp method
def max_sub_array(nums)
  max=value=nums[0]
  nums[1..-1].each do |n|
    value= value+n > n ? value+n : n
    max=value if value>max
  end
  max
end

# Way 3: divide and conquer 
def max_sub_array(nums)
  return -2**32 if nums==[]
  mid=nums.size/2
  return nums[0] if mid==0
  answer=[max_sub_array(nums[0..mid-1]),max_sub_array(nums[mid..-1])].max
  now,may=nums[mid],nums[mid]
  (mid-1).downto(0){|i| may=[may,now+=nums[i]].max }
  now=may
  (mid+1..nums.size-1).each{ |i| may=[may,now+=nums[i]].max}
  [may,answer].max
end

# Way 4: bit ops

# Way 5: primitive dp method

