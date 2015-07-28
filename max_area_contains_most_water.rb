# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  return 0 if height.size<2
  maxl=l=0
  maxr=r=height.size-1
  max_v=[height[maxl],height[maxr]].min*(maxr-maxl)
  while l<r
    if height[l]>height[maxl]||height[r]>height[maxr]
      max_v=[height[l],height[r]].min*(r-l) if max_v<[height[l],height[r]].min*(r-l) 
      maxl,maxr=l,r
    end
    if(height[l]>height[r])
      r-=1
    else
      l+=1
    end
  end
  max_v
end
