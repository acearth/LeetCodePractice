def maximum_gap(nums)
  return 0 if nums.size < 2 || nums.max == nums.min
  bucketLen = [1, (nums.max - nums.min) / nums.size].max
  lowest = nums.min ## necessary!
  buckets = []
  bucketMin = []
  bucketMax = []
  ((nums.max - nums.min + 1) / bucketLen + 1).times { buckets << [] }
  nums.each do |n|
    i = (n - lowest) / bucketLen ## If not declared lowest, the machine will evaluate nums.min every time !
    if !buckets[i].include? n
      buckets[i] << n
      bucketMax[i] = n if bucketMax[i] == nil || bucketMax[i] < n
      bucketMin[i] = n if bucketMin[i] == nil || bucketMin[i] > n
    end
  end
  last = bucketMax[0]
  gap = 0
  1.upto(buckets.size - 1) do |i|
    if buckets[i].size > 0
      gap = [bucketMin[i] - last, gap].max
      last = bucketMax[i]
    end
  end
  gap
end

# Q-164: There is N-1 buckets for (N-2) elements (without max and min)
#         At least one bucket is empty, then the max gap must cross borders
def maximum_gap(nums)
  return 0 if nums.size < 2 || nums.max == nums.min
  gap = ((nums.max - nums.min) / (nums.size - 1.0)).ceil #up to ceil
  minimum = nums.min
  ranges = nums.size.times.map { [2 ** 32, -1 * 2 ** 32] }
  nums.each do |n|
    i = (n - minimum) / gap
    ranges[i] = [[ranges[i][0], n].min, [ranges[i][1], n].max]
  end

  p ranges
  ranges.size.times do |i|
    next if ranges[i][0] == 2 ** 32
    gap = [ranges[i][0] - minimum, gap].max
    minimum = ranges[i][1]
  end
  gap
end