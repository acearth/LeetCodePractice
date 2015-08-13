def largest_rectangle_area(height)
  stack=Array.new
  left,right=[],[]
  height.each_with_index do |n,i|
    stack<<i if stack.size==0 || height[stack.last]<=n
    while stack.last!=nil && height[stack.last]>n
      left[stack.pop]=i-1
    end
    stack<<i
  end
  (height.size-1).downto(0) do |i|
    stack<<i if ( stack.size==0 || height[stack.last]<=height[i] )
    while stack.last!=nil && height[stack.last]>height[i]
      right[stack.pop]=i+1
    end
    stack<<i
  end
  max=0
  height.size.times do|i|
    left[i]=height.size-1 if left[i]==nil
    right[i]=0 if right[i]==nil
  end
  height.size.times {|i| max=[height[i]*(left[i]-right[i]+1),max].max }
  max
end
a=[2,1,5,6,2,3]
p largest_rectangle_area(a)

