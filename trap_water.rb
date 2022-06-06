# Q-42: trap water, classic! wait for monotone-stack solution
# NOTE: Without DP array, we also could calculate easily by two pointers, but result in TLE
# In this way, we collect water in depth rather than in width
def trap_dp(height)
  left, right = [0], [height[-1]]
  height.size.times { |i| left.push [left.last, height[i]].max }
  (height.size - 1).downto(0) { |i| right.unshift [right.first, height[i]].max }
  height.size.times.map { |i| [[left[i], right[i]].min - height[i], 0].max }.reduce(:+)
end

# FAST and EASY, O(n) time with O(n) space
def trap(height)
  left, right = 0, height.size - 1
  left_max = right_max = 0
  collected = 0
  while left < right
    left_max = height[left] if height[left] > left_max
    right_max = height[right] if height[right] > right_max
    if left_max < right_max
      collected += left_max - height[left]
      left += 1
    else
      collected += right_max - height[right]
      right -= 1
    end
  end
  collected
end