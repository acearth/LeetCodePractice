# NOT GOOD
def subsets_2015(arr)
  return [[]] if arr.size == 0
  pre = subsets(arr[0...-1])
  psize, last = pre.size, arr[-1]
  0.upto(psize - 1) { |i| pre << Array.new(pre[i]) + [last] }
  psize.upto(pre.size - 1) { |i| pre[i].sort! }
  pre
end

# Q-78: backtracking added for subset
def subsets(nums)
  result = []
  backtracking(nums, 0, [], result)
  result
end

def backtracking(nums, start, collected, result)
  result << [] + collected
  (start...nums.size).each do |i|
    collected << nums[i]
    backtracking(nums, i + 1, collected, result)
    collected.pop
  end
end