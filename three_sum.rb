#q-15: two pointers solution
def three_sum_two_pointers(nums)
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

def three_sum_with_set_collection(nums)
  require 'set'
  nums.sort!
  result = []
  nums.size.times do |i|
    break if nums[i] > 0
    next if i > 0 && nums[i] == nums[i - 1]
    set = Set.new
    (i + 1...nums.size).each do |j|
      next if j > i + 2 && nums[j] == nums[j - 1] && nums[j - 1] == nums[j - 2]
      if set.include? ((-nums[i] - nums[j]))
        result << [nums[i], nums[j], -nums[i] - nums[j]]
        set.delete(-nums[i] - nums[j])
      else
        set.add(nums[j])
      end
    end
  end
  result
end

def three_sum_hash_easy_to_TLE(nums)
  nums.sort!
  has, result = Hash.new { |h, k| h[k] = [] }, []
  nums.each_with_index { |n, i| has[n] << i }
  nums.size.times do |i|
    break if nums[i] > 0
    next if i > 0 && nums[i] == nums[i - 1]
    (i + 1...nums.size).each do |j|
      next if j > i + 1 && nums[j] == nums[j - 1]
      found = has[-nums[i] - nums[j]].select { |k| k > j }
      result << [nums[i], nums[j], nums[found.first]] if found.any?
    end
  end
  result
end

a = [-1, 0, 1, 2, -1, -4]
p three_sum_with_set_collection(a)