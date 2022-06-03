#q-15: two pointer solution
def three_sum(nums)
  nums.sort!
  result = []
  nums.each_with_index do |n, i|
    break if n > 0 # important speed up
    left, right = i + 1, nums.size - 1
    next if i > 0 && n == nums[i - 1] # note: speed up condition
    while left < right
      if nums[left] + nums[right] + n > 0
        right -= 1
      elsif nums[left] + nums[right] + n < 0
        left += 1
      else
        result << [n, nums[left], nums[right]]
        # Do remove-dup after least one tuple is found
        # Otherwise right <= left then some answer been rejected
        left += 1 while nums[left] == nums[left + 1]
        right -= 1 while nums[right] == nums[right -1]
        left, right = left + 1, right - 1
      end
    end
  end
  result
end