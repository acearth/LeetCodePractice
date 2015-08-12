def trap(height)
  return 0 if height.size<3
  leftMax, rightMax=[0], []
  rightMax[height.size-1]=height[height.size-1]
  height.each_with_index { |h, i| leftMax[i]=[h, leftMax[i-1]].max }
  (height.size-2).downto(0) { |i| rightMax[i]=[height[i], rightMax[i+1]].max }
  water_collected=0
  height.each_with_index { |h, i| water_collected+=[leftMax[i], rightMax[i]].min-height[i] }
  water_collected
end
