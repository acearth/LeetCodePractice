# Q-239: slide window by monotone-queue
# NOTE:
#   1. for series ..(-k)...X...(k)..., if X is the largest one, we can surely remove impossible elements less than X.
#     Since each sub-series contains X will definitely output X.
#   2. pop head if the head is slided-out element. If the slide-out element is not the head, it can be removed, or in
#      queue tail
#   3. push element on tail, but remove all smaller elements before push(since all smaller ones cannot be output-ed)
def max_sliding_window(nums, k)
  q, result = [], []
  (0...k).each do |i|
    q.pop while q.any? && q.last < nums[i]
    q << nums[i]
  end
  result << q.first
  (k...nums.size).each do |i|
    q.shift if nums[i - k] == q.first
    q.pop while q.any? && q.last < nums[i]
    q << nums[i]
    result << q.first
  end
  result
end
#
# nums = [1, 3, -1, -3, 5, 3, 6, 7]
# p max_sliding_window(nums, 3)
# p max_sliding_window(nums, 3) == [3, 3, 5, 5, 6, 7]
#
# nums = [9, 10, 9, -7, -4, -8, 2, -6]
# p max_sliding_window nums, 5