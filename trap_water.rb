def trap(height)
  return 0 if height.size<3
  left, right = [height[0]], [height[-1]]
  height[1..-1].each { |h| left<<[h, left[-1]].max }
  height[0...-1].reverse.each { |h| right<<[h, right[-1]].max }
  right.reverse!
  collected=0
  height.size.times { |i| collected+=[left[i], right[i]].min-height[i] }
  collected
end
