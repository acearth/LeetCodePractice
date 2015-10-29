def max_area(height)
  l, r = 0, height.size-1
  get=0
  while l<r
    cur_get = [height[l],height[r]].min * (r-l)
    get = cur_get if cur_get > get
    left=[height[l+1],height[r]].min
    right=[height[l],height[r-1]].min
    left > right ?  (l+=1) : (r-=1)
  end
  get
end
