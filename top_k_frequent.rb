def top_k_frequent(nums, k)
  freq = Hash.new { |h, k| h[k] = 0 }
  nums.each { |n| freq[n] += 1 }
  freq.sort_by { |_, v| v }.map { |k, _| k }.reverse[0...k]
end

# Q-347 quick select
# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  a = nums.group_by(&:itself).transform_values(&:count).map { |k, v| [k, v] }
  left, right = 0, a.size - 1
  while (q = partition(a, left, right)) != k - 1
    if q > k - 1
      right = q - 1
    else
      left = q + 1
    end
  end
  a[0..q].map(&:first)
end

def partition(nums, left, right)
  x = rand(right - left) + left
  nums[x], nums[right] = nums[right], nums[x]
  i = left - 1
  (left...right).each do |j|
    next if nums[j].last < nums[right].last
    i += 1
    nums[i], nums[j] = nums[j], nums[i]
  end
  nums[i + 1], nums[right] = nums[right], nums[i + 1]
  i + 1
end

nums = [1, 1, 1, 2, 2, 3]
k = 2
p top_k_frequent(nums, k)
p top_k_frequent(nums, k) == [1, 2]
p top_k_frequent([3, 0, 1, 0], 1)
p top_k_frequent([3, 0, 1, 0], 1) == [1]
